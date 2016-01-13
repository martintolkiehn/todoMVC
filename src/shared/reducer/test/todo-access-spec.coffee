chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List} = require 'immutable'

TodoAccess = require '../todo-access'

describe 'todo state access', ->

  it 'has initial state', ->
    newState = TodoAccess.INITIAL_STATE
    expectedState = List()
    expect(newState).to.equal(expectedState)

  it 'add todo to list', ->
    text1 = 'Milch holen'
    text2 = 'Butter nicht vergessen'
    todo1 = TodoAccess.createTodo text1
    todo2 = TodoAccess.createTodo text2
    oldState = List([
      todo1
    ])
    newState = TodoAccess.addTodo oldState, text2
    expectedState = List([
      todo1
      todo2
    ])
    expect(newState).to.equal(expectedState)
