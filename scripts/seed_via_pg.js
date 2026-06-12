const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

// simple file-backed logger to capture output when terminal capture is unreliable
try {
  const logFile = path.join(__dirname, 'seed_log.txt');
  const append = (s) => { try { fs.appendFileSync(logFile, new Date().toISOString() + ' ' + s + '\n'); } catch (e) {} };
  const _log = console.log.bind(console);
  const _err = console.error.bind(console);
  console.log = function(...args){ _log(...args); append(args.map(a=>String(a)).join(' ')); };
  console.error = function(...args){ _err(...args); append('ERROR: ' + args.map(a=>String(a)).join(' ')); };
} catch (e) {
  // ignore logging setup failures
}

async function main() {
  const conn = process.env.DC_PG_CONN || 'postgresql://127.0.0.1:5432/fdcdb';
  const client = new Client({ connectionString: conn });
  await client.connect();
  console.log('Connected to Postgres at', conn);

  // list tables
  const tablesRes = await client.query(`SELECT table_name FROM information_schema.tables WHERE table_schema='public'`);
  const tables = tablesRes.rows.map(r => r.table_name.toLowerCase());
  console.log('Found tables:', tables.join(', '));

  // mapping helper
  const candidates = (type)=>{
    const t = type;
    const snake = t.replace(/([A-Z])/g, '_$1').replace(/^_/, '').toLowerCase();
    return [t.toLowerCase(), snake, snake + 's', snake.replace(/_/g, ''), snake + '_tbl'];
  };

  const seed = JSON.parse(fs.readFileSync(path.join(__dirname, '..', 'dataconnect', 'seed_data_parsed.json'), 'utf8'));

  async function insertIfTable(type, row) {
    const cands = candidates(type);
    const table = tables.find(tbl => cands.includes(tbl));
    if (!table) {
      console.log(`No table found for type ${type} (candidates: ${cands.join(', ')})`);
      return;
    }
    const colsRes = await client.query("SELECT column_name FROM information_schema.columns WHERE table_schema='public' AND table_name=$1", [table]);
    const cols = colsRes.rows.map(r => r.column_name);
    const insertCols = [];
    const insertVals = [];
    const params = [];
    let i = 1;
    for (const k of Object.keys(row)) {
      if (cols.includes(k)) {
        insertCols.push(k);
        insertVals.push(`$${i++}`);
        params.push(row[k]);
      }
    }
    if (insertCols.length === 0) {
      console.log(`No matching columns to insert for table ${table}`);
      return;
    }
    const quotedTable = '"' + table.replace(/"/g, '""') + '"';
    const quotedCols = insertCols.map(c => '"' + c.replace(/"/g, '""') + '"');
    const sql = `INSERT INTO ${quotedTable} (${quotedCols.join(',')}) VALUES (${insertVals.join(',')}) ON CONFLICT DO NOTHING`;
    console.log('Inserting into', table, insertCols);
    await client.query(sql, params);
  }

  // Seed rows based on parsed seed file
  if (seed.user_insertMany) {
    for (const u of seed.user_insertMany) {
      const row = {
        id: u.id,
        displayname: u.displayName || u.displayname,
        createdat: u.createdAt || u.created_at,
        email: u.email,
        photourl: u.photoUrl || u.photourl,
      };
      await insertIfTable('User', row);
    }
  }
  if (seed.aIModel_insertMany) {
    for (const m of seed.aIModel_insertMany) {
      const row = { id: m.id, createdat: m.createdAt, description: m.description, isactive: m.isActive, modelname: m.modelName, version: m.version };
      await insertIfTable('AIModel', row);
    }
  }
  if (seed.analysisReport_insertMany) {
    for (const r of seed.analysisReport_insertMany) {
      const row = { id: r.id, userid: r.userId, createdat: r.createdAt, negativepercentage: r.negativePercentage, outstandingpercentage: r.outstandingPercentage, positivepercentage: r.positivePercentage, reportname: r.reportName, sourcefilename: r.sourceFileName };
      await insertIfTable('AnalysisReport', row);
    }
  }
  if (seed.analyzedText_insertMany) {
    for (const a of seed.analyzedText_insertMany) {
      const row = { id: a.id, analysisreportid: a.analysisReportId, fulltext: a.fullText };
      await insertIfTable('AnalyzedText', row);
    }
  }
  if (seed.textSegmentSentiment_insertMany) {
    for (const t of seed.textSegmentSentiment_insertMany) {
      const row = { id: t.id, analysisreportid: t.analysisReportId, analyzedtextid: t.analyzedTextId, segmenttext: t.segmentText, sentimentlabel: t.sentimentLabel, sentimentscore: t.sentimentScore };
      await insertIfTable('TextSegmentSentiment', row);
    }
  }

  await client.end();
  console.log('Seeding complete');
  try {
    const marker = require('path').join(__dirname, 'seed_complete.marker');
    require('fs').writeFileSync(marker, new Date().toISOString());
  } catch (e) {
    // ignore
  }
}

main().catch(err=>{console.error(err); process.exitCode=1});
