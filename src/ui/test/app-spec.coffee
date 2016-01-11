{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'
jsdom = require 'jsdom'

{App} = require '../../../web/script-components/app'

global.document = jsdom.jsdom('<!doctype html><html><body><div id="root"></div></body></html>')
global.window = document.defaultView

describe 'root app component', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <App/>
    )
    AppTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'div'
    )

    expect(AppTag).to.exist
