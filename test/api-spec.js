const request = require('supertest');
const chai = require('chai');
chai.should();
const app = require('../server');

describe('Basic demo http json api', () => {

  it('should respond to GET /', () => request(app)
    .get('/')
    .expect('Content-Type', /json/)
    .expect('Content-Length', '13')
    .expect(200)
    .then(res => {
      res.body.data.should.be.equal('ok');
    })
  );

});
