Firebase Cloud Functions for AI processing

Setup

1. Install deps and deploy from `functions/`:

```bash
cd functions
npm install
```

2. Provide secrets (recommended: use Firebase/Secret Manager)

Option A — recommended (Firebase CLI, stores in Secret Manager):

```bash
firebase functions:secrets:set OPENAI_API_KEY "sk_..."
firebase functions:secrets:set FUNCTION_SECRET "some-secret"
firebase functions:secrets:set AI_PROVIDER "openai"
```

Option B — gcloud Secret Manager directly:

```bash
echo -n "sk_..." | gcloud secrets create OPENAI_API_KEY --data-file=- --project YOUR_PROJECT_ID
gcloud secrets versions add OPENAI_API_KEY --data-file=<(echo -n "sk_...")
```

Option C — local env for emulator/testing only:

macOS / Linux:
```bash
export OPENAI_API_KEY=your_key_here
export AI_PROVIDER=openai
export FUNCTION_SECRET=some-secret
```
PowerShell:
```powershell
$env:OPENAI_API_KEY="your_key_here"
$env:AI_PROVIDER="openai"
$env:FUNCTION_SECRET="some-secret"
```

Example: process a collection locally via emulator (after starting emulators):

```bash
curl -X POST "http://localhost:5001/YOUR_PROJECT/us-central1/processCollection" -H "Content-Type: application/json" -d '{"collection":"Feedback"}'
```

Example: save feedback to SQL (placeholder implementation writes to Firestore queue):

```bash
curl -X POST "http://localhost:5001/YOUR_PROJECT/us-east4/saveFeedbackToSql" \
    -H "Content-Type: application/json" \
    -d '{"your_name":"Alice", "your_city":"City"}'
```

If deployed to production, the function URL will be:

```
https://us-east4-sou-feedback-app.cloudfunctions.net/saveFeedbackToSql
```

3. Deploy:

```bash
firebase deploy --only functions:processAllCollections
```

Local testing (emulator):

```bash
firebase emulators:start --only functions,firestore
# then call the function endpoint
```

Notes
- The function uses a simple stub when no AI provider configured.
- For production, prefer Vertex AI or OpenAI SDKs and add batching, rate limiting,
  chunking and error handling.
