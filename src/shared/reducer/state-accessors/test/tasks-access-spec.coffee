{ expect } = require 'chai'

TasksAccess = require '../tasks-access'
TaskAccess = require '../task-access'

describe 'test tasks-access module', ->

  it 'test initial state', ->
    targetTasksState = []
    actualTasksState = TasksAccess.initialState
    expect(actualTasksState).to.deep.equal(targetTasksState)

  it 'test method isValid(initialState): true', ->
    validTasksState = TasksAccess.initialState
    isValid = TasksAccess.isValid validTasksState
    expect(isValid).to.equal(true)

  it 'test method isValid(empty array): true', ->
    validTasksState = []
    isValid = TasksAccess.isValid validTasksState
    expect(isValid).to.equal(true)

  it 'test method isValid(array of valid tasks): true', ->
    validTasksState = [
      TaskAccess.createTask 1, 'Milch holen'
      TaskAccess.createTask 2, 'Wurst nicht vergessen'
    ]
    isValid = TasksAccess.isValid validTasksState
    expect(isValid).to.equal(true)

  it 'test method isValid(42): false', ->
    invalidTasksState = 42
    isValid = TasksAccess.isValid invalidTasksState
    expect(isValid).to.equal(false)

  it 'test method isValid({}): false', ->
    invalidTasksState = {}
    isValid = TasksAccess.isValid invalidTasksState
    expect(isValid).to.equal(false)

  it 'test method isValid(array of invalid tasks): false', ->
    invalidTasksState = [
      42
    ]
    isValid = TasksAccess.isValid invalidTasksState
    expect(isValid).to.equal(false)

  it 'test method createNewTaskId', ->
    tasksState = [
      TaskAccess.createTask 1, 'Milch holen'
      TaskAccess.createTask 2, 'Wurst nicht vergessen'
    ]
    expectedTaskId = 3
    createdTaskId = TasksAccess.createNewTaskId tasksState
    expect(createdTaskId).to.deep.equal(expectedTaskId)

  it 'test method appendTask', ->
    task1 = TaskAccess.createTask 1, 'Milch holen'
    task2 = TaskAccess.createTask 2, 'Wurst nicht vergessen'
    task3 = TaskAccess.createTask 3, 'und die Oma besuchen'
    oldTasksState = [
      task1
      task2
    ]
    expectedTasksState = [
      task1
      task2
      task3
    ]
    actualTasksState = TasksAccess.appendTask oldTasksState, task3
    expect(actualTasksState).to.deep.equal(expectedTasksState)
