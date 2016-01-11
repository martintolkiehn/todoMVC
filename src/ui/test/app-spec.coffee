{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'
jsdom = require 'jsdom'

{App} = require '../../../web/script-components/app'
{Header} = require '../../../web/script-components/header'
{TaskAdder} = require '../../../web/script-components/task-adder'

global.document = jsdom.jsdom('<!doctype html><html><body><div id="root"></div></body></html>')
global.window = document.defaultView

describe 'root app component', ->

  renderedComponent = TestUtils.renderIntoDocument(
    <App/>
  )

  it 'should exist', ->
    appTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'div'
    )

    expect(appTag).to.exist

  it 'has a header', ->
    headerTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'h1'
    )

    expect(headerTag.textContent).to.equal('todoMVC')

  it 'has a task adder', ->
    taskAdderTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'input'
    )

    expect(taskAdderTag).to.exist
