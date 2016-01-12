{ expect } = require 'chai'

TaskAccess = require '../task-access'

describe 'test task-access module', ->

  it 'test method createTask', ->
    id = 42
    name = 'Milch holen'
    targetTaskState =
      id: id
      name: name
      completed: false
    actualTaskState = TaskAccess.createTask id, name
    expect(actualTaskState).to.deep.equal(targetTaskState)
    expect(TaskAccess.isValid actualTaskState).to.equal(true)

  it 'test method createTask - default name', ->
    id = 42
    name = ''
    targetTaskState =
      id: id
      name: name
      completed: false
    actualTaskState = TaskAccess.createTask id
    expect(actualTaskState).to.deep.equal(targetTaskState)
    expect(TaskAccess.isValid actualTaskState).to.equal(true)

  it 'test method isValid: true', ->
    validTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    isValid = TaskAccess.isValid validTaskState
    expect(isValid).to.equal(true)

  it 'test method isValid(42): false', ->
    invalidTaskState = 42
    isValid = TaskAccess.isValid invalidTaskState
    expect(isValid).to.equal(false)

  it 'test method isValid([]): false', ->
    invalidTaskState = []
    isValid = TaskAccess.isValid invalidTaskState
    expect(isValid).to.equal(false)

  it 'test method isValid({}): false', ->
    invalidTaskState = {}
    isValid = TaskAccess.isValid invalidTaskState
    expect(isValid).to.equal(false)

  it 'test method getId', ->
    id = 42
    taskState =
      id: id
      name: 'Milch holen'
      completed: true
    actualId = TaskAccess.getId taskState
    expect(actualId).to.equal(id)

  it 'test method getName', ->
    name = 'Milch holen'
    taskState =
      id: 42
      name: name
      completed: false
    actualName = TaskAccess.getName taskState
    expect(actualName).to.equal(name)

  it 'test method isCompleted', ->
    completed = true
    taskState =
      id: 42
      name: 'Milch holen'
      completed: completed
    actualCompleted = TaskAccess.isCompleted taskState
    expect(actualCompleted).to.equal(completed)

  it 'test method rename', ->
    oldTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    name = 'Milsch holen'
    expectedTaskState =
      id: 42
      name: name
      completed: true
    actualTaskState = TaskAccess.rename oldTaskState, name
    expect(actualTaskState).to.deep.equal(expectedTaskState)

  it 'test method complete', ->
    oldTaskState =
      id: 42
      name: 'Milch holen'
      completed: false
    expectedTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    actualTaskState = TaskAccess.complete oldTaskState
    expect(actualTaskState).to.deep.equal(expectedTaskState)

  it 'test method uncomplete', ->
    oldTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    expectedTaskState =
      id: 42
      name: 'Milch holen'
      completed: false
    actualTaskState = TaskAccess.uncomplete oldTaskState
    expect(actualTaskState).to.deep.equal(expectedTaskState)

  it 'test method toggleCompletion', ->
    oldTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    expectedTaskState =
      id: 42
      name: 'Milch holen'
      completed: false
    actualTaskState = TaskAccess.toggleCompletion oldTaskState
    expect(actualTaskState).to.deep.equal(expectedTaskState)

    oldTaskState =
      id: 42
      name: 'Milch holen'
      completed: false
    expectedTaskState =
      id: 42
      name: 'Milch holen'
      completed: true
    actualTaskState = TaskAccess.toggleCompletion oldTaskState
    expect(actualTaskState).to.deep.equal(expectedTaskState)
