const express = require('express');
const index = require('./index');

const app = express();
// Parse JSON bodies; fail fast on invalid JSON and limit size
app.use(express.json({ strict: true, limit: '1mb' }));

// JSON parse error handler — returns 400 instead of crashing the route
app.use((err, req, res, next) => {
  if (err && (err instanceof SyntaxError || err.type === 'entity.parse.failed')) {
    console.warn('Invalid JSON payload:', err.message);
    return res.status(400).json({ error: 'Invalid JSON payload' });
  }
  next();
});

// Mount handlers exported from index.js
if (index.processCollection) {
  app.all('/processCollection', (req, res) => index.processCollection(req, res));
}
if (index.processAllCollections) {
  app.all('/processAllCollections', (req, res) => index.processAllCollections(req, res));
}

// Health check
app.get('/health', (req, res) => res.status(200).send('ok'));

// Favicon route to avoid browser 403 when requesting /favicon.ico
app.get('/favicon.ico', (req, res) => res.status(204).end());

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`Server listening on port ${port}`));

module.exports = app;



