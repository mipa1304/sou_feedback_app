const functions = require('firebase-functions');
const admin = require('firebase-admin');
const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
// Node 18+ provides global `fetch` — no need for node-fetch dependency.

const secretClient = new SecretManagerServiceClient();

async function getSecretValue(secretId) {
  // First check process.env
  if (process.env[secretId]) return process.env[secretId];

  // Derive project id
  const projectId = process.env.GCP_PROJECT || process.env.GCLOUD_PROJECT || (process.env.FIREBASE_CONFIG ? JSON.parse(process.env.FIREBASE_CONFIG).projectId : null);
  if (!projectId) return null;

  const name = `projects/${projectId}/secrets/${secretId}/versions/latest`;
  try {
    const [version] = await secretClient.accessSecretVersion({ name });
    const payload = version.payload.data.toString('utf8');
    return payload;
  } catch (e) {
    console.warn(`Unable to access secret ${secretId}:`, e.message || e);
    return null;
  }
}

admin.initializeApp();

// HTTP function to process all top-level collections, call an AI provider,
// and write summaries back into Firestore under `ai_summaries`.
exports.processAllCollections = functions.https.onRequest(async (req, res) => {
  try {
    // Optional: require a secret header for safety
    const secret = (await getSecretValue('FUNCTION_SECRET')) || process.env.FUNCTION_SECRET;
    const authHeader = req.get('authorization') || '';
    if (secret && authHeader !== `Bearer ${secret}`) {
      return res.status(401).json({ error: 'Unauthorized' });
    }

    const firestore = admin.firestore();
    const collections = await firestore.listCollections();
    for (const coll of collections) {
      const snap = await coll.get();
      if (snap.empty) continue;

      // Concatenate small representations of documents for AI processing.
      const texts = snap.docs.map(d => JSON.stringify(d.data())).join('\n---\n');

      // Call AI provider (stubbed). Configure AI_PROVIDER env var to 'openai' or 'vertex' and provide keys.
      const aiSummary = await callAiProvider(texts);

      await firestore.collection('ai_summaries').add({
        collection: coll.id,
        summary: aiSummary,
        processedAt: admin.firestore.FieldValue.serverTimestamp(),
        docCount: snap.size,
      });
    }

    return res.status(200).json({ ok: true });
  } catch (err) {
    console.error('processAllCollections error', err);
    return res.status(500).json({ error: err.message });
  }
});

// HTTP function to process a single collection: create embeddings and summary per document.
exports.processCollection = functions.https.onRequest(async (req, res) => {
  try {
    const collectionName = req.query.collection || req.body.collection;
    if (!collectionName) return res.status(400).json({ error: 'collection param required' });

    const firestore = admin.firestore();
    const coll = firestore.collection(collectionName);
    const snap = await coll.get();
    if (snap.empty) return res.status(200).json({ ok: true, note: 'empty collection' });

    // For each document, produce a short summary and embedding
    for (const doc of snap.docs) {
      const data = doc.data();
      const text = JSON.stringify(data);
      const summary = await callAiProvider(text, {mode: 'summary'});
      const embedding = await callAiEmbedding(text);

      await firestore.collection('ai_embeddings').add({
        sourceCollection: collectionName,
        docId: doc.id,
        summary,
        embedding,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    }

    return res.status(200).json({ ok: true, processed: snap.size });
  } catch (err) {
    console.error('processCollection error', err);
    return res.status(500).json({ error: err.message });
  }
});

// Helper to get embeddings from AI provider (basic OpenAI REST example)
async function callAiEmbedding(text) {
  const provider = process.env.AI_PROVIDER || (await getSecretValue('AI_PROVIDER')) || 'openai';
  if (provider === 'openai') {
    let key = process.env.OPENAI_API_KEY;
    if (!key) key = await getSecretValue('OPENAI_API_KEY');
    if (!key) throw new Error('OPENAI_API_KEY not set');

    const payload = { input: text, model: 'text-embedding-3-small' };
    const resp = await fetch('https://api.openai.com/v1/embeddings', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${key}` },
      body: JSON.stringify(payload),
    });
    const data = await resp.json();
    return data?.data?.[0]?.embedding || null;
  }
  return null;
}

async function callAiProvider(text) {
  const provider = process.env.AI_PROVIDER || 'stub';
  if (provider === 'openai') {
    let key = process.env.OPENAI_API_KEY;
    if (!key) {
      key = await getSecretValue('OPENAI_API_KEY') || await getSecretValue('openai-api-key');
    }
    if (!key) throw new Error('OPENAI_API_KEY not set (env or Secret Manager)');
    // Example OpenAI call using REST API (replace with official SDK if preferred)
    const payload = {
      model: 'gpt-4o-mini',
      messages: [{ role: 'user', content: `Summarize the following documents:\n${text}` }],
      max_tokens: 800,
    };
    const resp = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${key}` },
      body: JSON.stringify(payload),
    });
    const data = await resp.json();
    return data?.choices?.[0]?.message?.content || JSON.stringify(data);
  }

  // Vertex AI or other providers could be added here.

  // Fallback stub (returns length and a short note)
  return `AI_STUB: processed ${text.length} chars`;
}
