chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect

ToDoReducer = require '../todos-reducer'
ToDoAccess = require '../todo-access'

describe 'todo reducer', ->

  it 'has initial state', ->
    oldState = undefined
    action = undefined
    newState = ToDoReducer.reduce oldState, action
    expectedState = ToDoAccess.INITIAL_STATE
    expect(newState).to.equal(expectedState)
