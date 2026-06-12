const fs = require('fs');
const http = require('http');

const gql = fs.readFileSync('dataconnect/seed_data.gql', 'utf8');
const body = JSON.stringify({ query: gql });

const options = {
  hostname: '127.0.0.1',
  port: 9399,
  path: '/v1/graphql',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': Buffer.byteLength(body)
  }
};

const req = http.request(options, (res) => {
  let data = '';
  res.on('data', (chunk) => { data += chunk; });
  res.on('end', () => {
    console.log('Status:', res.statusCode);
    console.log('Response:', data);
  });
});

req.on('error', (e) => {
  console.error('Request error:', e);
});

req.write(body);
req.end();
