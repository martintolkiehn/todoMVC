chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List} = require 'immutable'

Actions = require '../../action/actions'
ToDoReducer = require '../todos-reducer'
ToDoAccess = require '../todo-access'

describe 'todo reducer', ->

  it 'should return initial state on invalid start state', ->
    oldState = undefined
    action = undefined
    newState = ToDoReducer.reduce oldState, action
    expectedState = ToDoAccess.INITIAL_STATE
    expect(newState).to.equal(expectedState)

  it 'should add new todo ', ->
    text = 'Milch holen'
    action = Actions.addToDo text
    oldState = ToDoAccess.INITIAL_STATE
    newState = ToDoReducer.reduce oldState, action
    expectedState = List().push(ToDoAccess.createToDo text)
    expect(newState).to.equal(expectedState)
