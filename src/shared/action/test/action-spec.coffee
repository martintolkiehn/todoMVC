{ expect } = require 'chai'

ActionType = require '../action-type'
Action = require '../action'
TaskFilter = require '../task-filter'

describe 'test action module', ->

  it 'test method addTask', ->
    name = 'Milch holen'
    targetAction =
      type: ActionType.ADD_NEW_TASK
      name: name
    actualAction = Action.addNewTask name
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method addTask - default name', ->
    name = ''
    targetAction =
      type: ActionType.ADD_NEW_TASK
      name: name
    actualAction = Action.addNewTask()
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method renameTask', ->
    id = 42
    name = 'Milch holen'
    targetAction =
      type: ActionType.RENAME_TASK
      id: id
      name: name
    actualAction = Action.renameTask id, name
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method renameTask - default name', ->
    id = 42
    name = ''
    targetAction =
      type: ActionType.RENAME_TASK
      id: id
      name: name
    actualAction = Action.renameTask id
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method deleteTask', ->
    id = 42
    targetAction =
      type: ActionType.DELETE_TASK
      id: id
    actualAction = Action.deleteTask id
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method completeTask', ->
    id = 42
    targetAction =
      type: ActionType.COMPLETE_TASK
      id: id
    actualAction = Action.completeTask id
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method uncompleteTask', ->
    id = 42
    targetAction =
      type: ActionType.UNCOMPLETE_TASK
      id: id
    actualAction = Action.uncompleteTask id
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method toggleTaskCompletion', ->
    id = 42
    targetAction =
      type: ActionType.TOGGLE_TASK_COMPLETION
      id: id
    actualAction = Action.toggleTaskCompletion id
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method deleteAllCompletedTasks', ->
    targetAction =
      type: ActionType.DELETE_ALL_COMPLETED_TASKS
    actualAction = Action.deleteAllCompletedTasks()
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method setTaskFilter', ->
    filter = TaskFilter.SHOW_COMPLETED
    targetAction =
      type: ActionType.SET_TASK_FILTER
      filter: filter
    actualAction = Action.setTaskFilter filter
    expect(actualAction).to.deep.equal(targetAction)

  it 'test method setTaskFilter - default filter', ->
    filter = TaskFilter.SHOW_ALL
    targetAction =
      type: ActionType.SET_TASK_FILTER
      filter: filter
    actualAction = Action.setTaskFilter()
    expect(actualAction).to.deep.equal(targetAction)
