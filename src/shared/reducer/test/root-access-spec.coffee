chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{Map} = require 'immutable'

RootAccess = require '../root-access'
ToDoAccess = require '../todo-access'

describe 'root state access', ->

  it 'has initial state', ->
    newState = RootAccess.INITIAL_STATE
    expectedState = Map({
      todos: ToDoAccess.INITIAL_STATE
    })
    expect(newState).to.equal(expectedState)
