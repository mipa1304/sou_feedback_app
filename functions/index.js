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

// Data Connect admin connector config (matches generated SDK)
const dcConnectorConfig = {
  connector: 'example',
  serviceId: 'soufeedbackapp',
  location: 'us-east4'
};

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

// HTTP function to accept feedback JSON and forward to Cloud SQL processing.
// This function is exported in region 'us-east4' so its URL will use that region.
// Currently this implementation writes the incoming payload to Firestore under
// `feedback_sql_queue` as a placeholder. Replace the placeholder with your
// Cloud SQL insert logic or Data Connect call when ready.
exports.saveFeedbackToSql = functions.region('us-east4').https.onRequest(async (req, res) => {
  try {
    if (req.method !== 'POST') {
      return res.status(405).json({ error: 'Method not allowed' });
    }

    const payload = req.body || {};

    // Optional auth: check Authorization header against secret.
    const secret = (await getSecretValue('FUNCTION_SECRET')) || process.env.FUNCTION_SECRET;
    const authHeader = req.get('authorization') || '';
    if (secret && authHeader !== `Bearer ${secret}`) {
      return res.status(401).json({ error: 'Unauthorized' });
    }

    // Placeholder: enqueue into Firestore for later SQL processing.
    const firestore = admin.firestore();
    await firestore.collection('feedback_sql_queue').add({
      payload,
      receivedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    return res.status(200).json({ ok: true });
  } catch (err) {
    console.error('saveFeedbackToSql error', err);
    return res.status(500).json({ error: err.message || String(err) });
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

// HTTP function to seed the Data Connect (Postgres) DB using the seed GraphQL.
exports.seedData = functions.region('us-east4').https.onRequest(async (req, res) => {
  try {
    const fs = require('fs');
    const path = require('path');
    const gqlPath = path.join(__dirname, '..', 'dataconnect', 'seed_data.gql');
    const gql = fs.readFileSync(gqlPath, 'utf8');

    // Dynamically require Data Connect admin helper so function definition
    // doesn't fail on startup if the subpath isn't exported in this environment.
    let validateAdminArgs;
    try {
      validateAdminArgs = require('firebase-admin/data-connect').validateAdminArgs;
    } catch (err) {
      return res.status(500).json({ ok: false, error: 'firebase-admin/data-connect not available in this environment', details: String(err) });
    }

    const { dc: dcInstance } = validateAdminArgs(dcConnectorConfig, undefined, undefined, undefined);

    // Try a few fallback ways to execute the seed GraphQL against the Data Connect instance.
    const attempts = [];

    if (typeof dcInstance.executeMutation === 'function') {
      try {
        const r = await dcInstance.executeMutation('CreateSeedData');
        return res.status(200).json({ ok: true, method: 'executeMutation by name', result: r });
      } catch (e) {
        attempts.push({ method: 'executeMutation by name', error: String(e) });
      }
      try {
        const r = await dcInstance.executeMutation(undefined, undefined, { document: gql });
        return res.status(200).json({ ok: true, method: 'executeMutation with document option', result: r });
      } catch (e) {
        attempts.push({ method: 'executeMutation with document', error: String(e) });
      }
    }

    if (typeof dcInstance.execute === 'function') {
      try {
        const r = await dcInstance.execute({ document: gql });
        return res.status(200).json({ ok: true, method: 'execute', result: r });
      } catch (e) {
        attempts.push({ method: 'execute', error: String(e) });
      }
    }

    if (typeof dcInstance.executeRaw === 'function') {
      try {
        const r = await dcInstance.executeRaw(gql);
        return res.status(200).json({ ok: true, method: 'executeRaw', result: r });
      } catch (e) {
        attempts.push({ method: 'executeRaw', error: String(e) });
      }
    }

    // If none of the above succeeded, return diagnostic info so we can iterate.
    return res.status(500).json({ ok: false, message: 'Unable to execute seed via Data Connect instance', attempts });
  } catch (err) {
    console.error('seedData error', err);
    return res.status(500).json({ error: err.message || String(err) });
  }
});

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
