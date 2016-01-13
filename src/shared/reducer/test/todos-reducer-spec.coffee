chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List} = require 'immutable'

Actions = require '../../action/actions'
TodoReducer = require '../todos-reducer'
TodoAccess = require '../todo-access'

describe 'todo reducer', ->

  it 'should return initial state on invalid start state', ->
    oldState = undefined
    action = undefined
    newState = TodoReducer.reduce oldState, action
    expectedState = TodoAccess.INITIAL_STATE
    expect(newState).to.equal(expectedState)

  it 'should return a new state including the todo given on ADD_TODO action', ->
    text = 'Milch holen'
    action = Actions.addTodo text
    oldState = TodoAccess.INITIAL_STATE
    newState = TodoReducer.reduce oldState, action
    expectedState = List().push(TodoAccess.createTodo text)
    expect(newState).to.equal(expectedState)
