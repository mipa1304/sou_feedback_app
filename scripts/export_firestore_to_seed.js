const fs = require('fs');
const path = require('path');
const admin = require('firebase-admin');

const serviceAccountPath = path.join(__dirname, '..', 'sou-feedback-app-firebase-adminsdk-4kmav-35ec5d37fe.json');
const serviceAccount = require(serviceAccountPath);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

function toPlainValue(value) {
  if (!value) return value;
  if (typeof value === 'object') {
    if (typeof value.toDate === 'function') {
      return value.toDate().toISOString();
    }
    if (Array.isArray(value)) {
      return value.map(toPlainValue);
    }
    if (value._delegate && typeof value._delegate === 'object') {
      return value._delegate;
    }
    const plain = {};
    for (const [k, v] of Object.entries(value)) {
      plain[k] = toPlainValue(v);
    }
    return plain;
  }
  return value;
}

function toGraphQLValue(value, indentLevel = 0) {
  const indent = '  '.repeat(indentLevel);
  if (value === null || value === undefined) return 'null';
  if (typeof value === 'string') return JSON.stringify(value);
  if (typeof value === 'number' || typeof value === 'boolean') return String(value);
  if (Array.isArray(value)) {
    if (value.length === 0) return '[]';
    const inner = value.map((item) => `${'  '.repeat(indentLevel + 1)}${toGraphQLValue(item, indentLevel + 1)}`).join('\n');
    return `[
${inner}
${indent}]`;
  }
  if (typeof value === 'object') {
    const entries = Object.entries(value);
    if (entries.length === 0) return '{}';
    const inner = entries.map(([k, v]) => `${'  '.repeat(indentLevel + 1)}${k}: ${toGraphQLValue(v, indentLevel + 1)}`).join('\n');
    return `{
${inner}
${indent}}`;
  }
  return JSON.stringify(String(value));
}

async function exportCollections() {
  const collections = await db.listCollections();
  const collectionNames = collections.map((c) => c.id);
  const outputFile = path.join(__dirname, '..', 'dataconnect', 'firestore_export.gql');

  let gql = 'mutation ExportFirestoreData {\n';
  const jsonExport = {};

  for (const collectionName of collectionNames) {
    const snapshot = await db.collection(collectionName).get();
    const docs = snapshot.docs.map((doc) => ({
      id: doc.id,
      ...toPlainValue(doc.data()),
    }));

    jsonExport[collectionName] = docs;

    gql += `  ${collectionName}_insertMany(data: [\n`;
    docs.forEach((doc, index) => {
      const docBody = { id: doc.id, ...doc };
      delete docBody.id;
      gql += `    {\n      id: ${JSON.stringify(doc.id)},\n`;
      const entries = Object.entries(docBody);
      entries.forEach(([key, value], entryIndex) => {
        gql += `      ${key}: ${toGraphQLValue(value, 2).replace(/\n/g, '\n      ')}${entryIndex < entries.length - 1 ? ',' : ''}\n`;
      });
      gql += `    }${index < docs.length - 1 ? ',' : ''}\n`;
    });
    gql += `  ])\n`;
  }

  gql += '}\n';

  fs.writeFileSync(outputFile, gql, 'utf8');
  fs.writeFileSync(path.join(__dirname, '..', 'dataconnect', 'firestore_export.json'), JSON.stringify(jsonExport, null, 2), 'utf8');

  console.log('Collections:', collectionNames.join(', ') || '(none)');
  console.log('Export written to:', outputFile);
  if (collectionNames.length === 0) {
    console.log('No Firestore data found.');
  }
}

exportCollections().catch((err) => {
  console.error(err);
  process.exit(1);
});
