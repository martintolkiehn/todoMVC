{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'
jsdom = require 'jsdom'
{TaskAdder} = require '../../../web/script-components/task-adder'

global.document = jsdom.jsdom('<!doctype html><html><body></body></html>')
global.window = document.defaultView

describe 'component task adder', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <TaskAdder />
    )
    taskAdderTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'input'
    )

    expect(taskAdderTag).to.exist()
