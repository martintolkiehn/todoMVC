chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
chai.use chaiAsPromised

describe 'test client', ->
  port = 3000
  
  it 'test correct title exists', ->
    browser.ignoreSynchronization = true
    browser.get 'index.html', 10000
    browser.sleep(1000).then( () -> 
      chai.expect(browser.getTitle()).to.equal('todoMVC');
    )
    #chai.expect($('title').getText()).to.equal('todoMVC')
    
    
    #$('title').getText().then (txt) ->
    #  expect(txt).to.equal('totoMVC')
      
    #expect(element(`by`.tagName('title')).getText()).to.equal('totoMVC')
    #expect(browser.getCurrentUrl()).to.equal("http://127.0.0.1:#{port}/index.html");
    #browser.get targetUrl
    #console.log '' + browser.getCurrentUrl()
    #alert 'ulf'
