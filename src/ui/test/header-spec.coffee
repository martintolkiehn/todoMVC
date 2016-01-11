{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'

{Header} = require '../../../web/script-components/header'

describe 'component header', ->
  it 'should exist', ->
    headerName = 'todoMVC'
    renderedComponent = TestUtils.renderIntoDocument(
      <Header name={headerName} />
    )
    headerTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'h1'
    )

    expect(headerTag.textContent).to.equal(headerName)
