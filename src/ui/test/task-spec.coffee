{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'

{Task} = require '../../../web/script-components/task'

describe 'component task', ->
  it 'should exist', ->
    taskName = 'Milch holen'
    renderedComponent = TestUtils.renderIntoDocument(
      <Task name={taskName} />
    )
    taskTag = TestUtils.findRenderedDOMComponentWithTag(
      renderedComponent, 'li'
    )

    expect(taskTag.textContent).to.equal(taskName)
