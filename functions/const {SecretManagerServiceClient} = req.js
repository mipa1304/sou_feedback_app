const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const {Pool} = require('pg');

const sm = new SecretManagerServiceClient();
let pool;

async function getSecret(name){
  const nameFull = `projects/${process.env.GCP_PROJECT}/secrets/${name}/versions/latest`;
  const [version] = await sm.accessSecretVersion({name: nameFull});
  return version.payload.data.toString('utf8');
}

async function initPool(){
  if (pool) return pool;
  const user = process.env.DB_USER || 'svcuser';
  const password = await getSecret(process.env.DB_PASSWORD_SECRET || 'DB_PASSWORD');
  const database = process.env.DB_NAME || 'sou_feedback_db';
  const instanceConn = process.env.INSTANCE_CONNECTION_NAME; // project:region:instance
  pool = new Pool({
    user,
    password,
    database,
    host: `/cloudsql/${instanceConn}`,
    port: 5432,
    // no SSL when using Unix socket
  });
  return pool;
}

exports.syncFirestoreToPostgres = async (change, context) => {
  const pool = await initPool();
  const docId = context.params.docId;
  const after = change.after.exists ? change.after.data() : null;

  if (!after) {
    await pool.query('DELETE FROM feedback WHERE id=$1', [docId]);
    return;
  }

  const keys = Object.keys(after);
  const cols = keys.join(',');
  const placeholders = keys.map((_,i)=>`$${i+2}`).join(',');
  const values = keys.map(k=> after[k]);
  const setClause = keys.map((k,i)=>`${k} = $${i+2}`).join(',');

  const sql = `INSERT INTO feedback(id, ${cols}) VALUES($1, ${placeholders}) ON CONFLICT (id) DO UPDATE SET ${setClause}`;
  await pool.query(sql, [docId, ...values]);
};