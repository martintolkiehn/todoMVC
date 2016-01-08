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
    expect('by').to.exist
    expect(element).to.exist
    expect($).to.exist
    done()

  it 'should wrap webdriver', (done) ->
    browser.driver.get 'http://localhost:3000/index.html'
    expect(browser.driver.getTitle()).to.eventually.equal 'todoMVC'
    done()
