{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'

{TaskAdder} = require '../../../web/script-components/task-adder'

describe 'component header', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <TaskAdder />
    )
    taskAdderTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'input'
    )

    expect(taskAdderTag).to.exist
