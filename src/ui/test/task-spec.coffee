{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'

{Task} = require '../../../web/script-components/task'

describe 'component task', ->
  it 'should exist', ->
    renderedComponent = TestUtils.renderIntoDocument(
      <Task />
    )
    taskTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'li'
    )

    expect(taskTag).to.exist
