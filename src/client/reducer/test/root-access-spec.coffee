chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{Map} = require 'immutable'

RootAccess = require '../root-access'
TodoAccess = require '../todo-access'

describe 'root state access', ->

  it 'has initial state', ->
    newState = RootAccess.INITIAL_STATE
    expectedState = Map({
      todos: TodoAccess.INITIAL_STATE
    })
    expect(newState).to.equal(expectedState)
