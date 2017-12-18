const { createServer } = require('http');

module.exports = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ data : 'ok' }));
});
