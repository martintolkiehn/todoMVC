{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'

{Tasks} = require '../../../web/script-components/tasks'

describe 'component tasks', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <Tasks />
    )
    tasksTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'ul'
    )

    expect(tasksTag).to.exist
