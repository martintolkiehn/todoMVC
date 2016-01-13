chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List, Map} = require 'immutable'

TodoAccess = require '../todo-access'

describe 'todo state access', ->

  it 'has initial state', ->
    newState = TodoAccess.INITIAL_STATE
    expectedState = List()
    expect(newState).to.equal(expectedState)

  it 'add todo to list', ->
    oldState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
    ])
    newState = TodoAccess.addTodo oldState, 'laktosefreie Milch holen'
    expectedState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
      Map(
        id: 18
        text: 'laktosefreie Milch holen'
      )
    ])
    expect(newState).to.equal(expectedState)
