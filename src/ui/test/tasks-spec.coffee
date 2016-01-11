{expect} = require 'chai'
React = require 'react'
TestUtils = require 'react-addons-test-utils'
TestUtilsAdditions = require 'react-testutils-additions'

{Tasks} = require '../../../web/script-components/tasks'

describe 'component tasks', ->

  task1Name = 'Milch holen'
  taskModels = [
    {name: task1Name}
  ]

  renderedComponent = TestUtils.renderIntoDocument(
    <Tasks tasks={taskModels} />
  )

  tasksTag = TestUtils.findRenderedDOMComponentWithTag(
    renderedComponent, 'ul'
  )

  it 'should exist', ->

    expect(tasksTag).to.exist

  it 'has tasks', ->

    taskTag = TestUtilsAdditions.find(tasksTag, 'ul li')[0]

    expect(taskTag.textContent).to.equal(task1Name)
