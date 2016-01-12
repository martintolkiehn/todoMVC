chai = require 'chai'
chaiAsPromised = require('chai-as-promised')
chai.use(chaiAsPromised)
expect = chai.expect

describe 'no protractor at all', ->
  it 'should still do normal tests', (done) ->
    expect(true).to.equal true
    done()
