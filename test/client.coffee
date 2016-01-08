chai = require 'chai'
chaiAsPromised = require('chai-as-promised')
chai.use(chaiAsPromised)
expect = chai.expect

describe 'no protractor at all', ->
  it 'should still do normal tests', (done) ->
    expect(true).to.equal true
    done()

describe 'protractor library', ->

  it 'should expose the correct global variables', (done) ->
    expect(protractor).to.exist
    expect(browser).to.exist
    expect(By).to.exist
    expect(element).to.exist
    expect($).to.exist
    done()

describe 'client', ->
  port = 3000
  baseUrl = "http://127.0.0.1:#{port}/"

  it 'has the right title', (done) ->
    browser.driver.get "#{baseUrl}/index.html"
    expect(browser.driver.getTitle()).to.eventually.equal 'todoMVC'
    done()
