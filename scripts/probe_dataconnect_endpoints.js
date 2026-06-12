const http = require('http');
const endpoints = ['/v1/graphql','/graphql','/v1','/','/query','/v1/query'];
const gql = 'query { __typename }';
function post(path){
  return new Promise((resolve,reject)=>{
    const data = JSON.stringify({query: gql});
    const options = {hostname:'127.0.0.1', port:9399, path, method:'POST', headers:{'Content-Type':'application/json','Content-Length':Buffer.byteLength(data)}};
    const req = http.request(options, res=>{
      let body=''; res.on('data',c=>body+=c); res.on('end',()=>resolve({path, status:res.statusCode, body}));
    });
    req.on('error',e=>resolve({path, error:String(e)}));
    req.write(data); req.end();
  });
}
(async ()=>{
  for(const p of endpoints){
    const r = await post(p);
    console.log(JSON.stringify(r));
  }
})();
