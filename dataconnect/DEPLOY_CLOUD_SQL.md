Steps to deploy Data Connect with Cloud SQL (Postgres)

1. Create a Postgres Cloud SQL instance named `soufeedbackapp-fdc`:

gcloud sql instances create soufeedbackapp-fdc \
  --database-version=POSTGRES_15 \
  --tier=db-f1-micro \
  --region=us-east4

2. Create a database and user (or use Cloud Console):

gcloud sql databases create fdcdb --instance=soufeedbackapp-fdc
gcloud sql users set-password postgres --password="<YOUR_PASSWORD>" --instance=soufeedbackapp-fdc

3. Configure connectivity: choose Public IP + Authorized networks, or Private IP + VPC.
   - For App Engine / Cloud Run / Functions: use Serverless VPC Access or Cloud SQL Auth Proxy.

4. Update `dataconnect/dataconnect.yaml` to reference the instance (already present):

  datasource:
    postgresql:
      database: "fdcdb"
      cloudSql:
        instanceId: "soufeedbackapp-fdc"

5. Ensure the Firebase service account (or the service account used by your runtime) has the `Cloud SQL Client` role.

6. Deploy Data Connect with Firebase CLI:

```bash
npx -y firebase-tools@latest deploy --only dataconnect --project sou-feedback-app
```

7. If using Cloud Functions or server-side admin SDK, ensure `@dataconnect/admin-generated` is installed and configured. The emulator generates SDKs at `src/dataconnect-admin-generated` and `functions/src/dataconnect-admin-generated`.

8. For production, enable `schemaValidation` in `dataconnect.yaml` if you want Postgres schema to match Data Connect strictly.

Troubleshooting:
- If the deploy fails, check `dataconnect-debug.log` and Cloud SQL IAM/Network settings.
- Use Cloud SQL Auth Proxy locally for secure connections during testing.
