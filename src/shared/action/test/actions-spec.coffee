{expect} = require 'chai'
Actions = require '../actions'
ActionTypes = require '../action-types'

describe 'todo actions', ->

  it 'should create an action for adding a new todo item', ->
    actualAction = Actions.addTodo 'Milch holen'
    expectedAction =
      type: ActionTypes.WEBSERVICE_CALL_IS_RUNNING
      info: 'save new todo item'
    expect(actualAction).to.deep.equal(expectedAction)

  it 'should create an action for changing text of an existing todo item', ->
    actualAction = Actions.changeTodoText 15, 'Milch holen'
    expectedAction =
      type: ActionTypes.CHANGE_TODO_TEXT
      pos: 15
      text: 'Milch holen'
    expect(actualAction).to.deep.equal(expectedAction)

  it 'should create an action for deleting an existing todo item', ->
    actualAction = Actions.removeTodo 27
    expectedAction =
      type: ActionTypes.REMOVE_TODO
      pos: 27
    expect(actualAction).to.deep.equal(expectedAction)

  it 'should create an action for toggeling the completion flag of an existing todo item', ->
    actualAction = Actions.toggleTodo 51
    expectedAction =
      type: ActionTypes.TOGGLE_TODO
      pos: 51
    expect(actualAction).to.deep.equal(expectedAction)

  it 'should create an action for toggeling the completion flag of all existing todo items', ->
    actualAction = Actions.toggleAllTodos()
    expectedAction =
      type: ActionTypes.TOGGLE_ALL_TODOS
    expect(actualAction).to.deep.equal(expectedAction)

  it 'should create an action for deleting all completed todo items', ->
    actualAction = Actions.removeAllCompletedTodos()
    expectedAction =
      type: ActionTypes.REMOVE_ALL_COMPLETED_TODOS
    expect(actualAction).to.deep.equal(expectedAction)
