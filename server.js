const { createServer } = require('http');

module.exports = createServer((req, res) => {
  const body = JSON.stringify({ data : 'ok' });
  res.writeHead(200, {
    'Content-Length': body.length,
    'Content-Type': 'application/json'
  });
  res.end(body);
});
