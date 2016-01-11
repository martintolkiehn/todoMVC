{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'
jsdom = require 'jsdom'

{Header} = require '../../../web/script-components/header'

#global.document = jsdom.jsdom('<!doctype html><html><body></body></html>')
#global.window = document.defaultView


describe 'component header', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <Header name={'todoMVC'}/>
    )
    headerTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'h1'
    )

    expect(headerTag.textContent).to.equal('todoMVC')
