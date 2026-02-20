// Simple token server for local development.
// Usage:
// 1. Install dependencies: `npm init -y && npm i firebase-admin express cors`
// 2. Run: `node tools/mint_token_server.js`
// 3. In app, the code will GET http://127.0.0.1:3000/token to receive a custom token.

const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');
const path = require('path');

// Path to service account JSON in this repo — adjust if different.
const serviceAccountPath = path.join(__dirname, '..', 'sou-feedback-app-firebase-adminsdk-4kmav-35ec5d37fe.json');

admin.initializeApp({
  credential: admin.credential.cert(require(serviceAccountPath)),
});

const app = express();
app.use(cors());

app.get('/token', async (req, res) => {
  try {
    // Use a fixed dev uid or allow override via ?uid=...
    const uid = req.query.uid || 'dev-user';
    const token = await admin.auth().createCustomToken(uid.toString());
    res.send(token);
  } catch (err) {
    console.error('Error creating custom token', err);
    res.status(500).send('error');
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log('Token server running on http://127.0.0.1:' + port + '/token');
});
