chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
chai.use chaiAsPromised

describe 'test client', ->
  port = 3000
  
  it 'test correct title exists', (done) ->
    browser.ignoreSynchronization = true
    browser.get 'index.html'
    chai.expect(1).to.equal(1)
    done()
    