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
  browser.driver.get "#{baseUrl}/index.html"
  browser.driver.ignoreSynchronization = true

  it 'has the right title', (done) ->
    expect(browser.driver.getTitle()).to.eventually.equal 'todoMVC'
    done()

  it 'has a root component', (done) ->
    expect(browser.driver.findElement(By.className('application-root'))).to.exist
    done()

  it 'has a header component', (done) ->
    expect(browser.driver.findElement(By.tagName('h1')).getText()).to.eventually.equal 'todoMVC'
    done()

  it 'has a TaskAdder component', (done) ->
    expect(browser.driver.findElement(By.tagName('input'))).to.exist
    done()
