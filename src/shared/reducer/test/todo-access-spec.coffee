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

  it 'add todo to list on add action', ->
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

  it 'should change text of a todo on edit action', ->
    oldState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
    ])
    newState = TodoAccess.editTodo oldState, 17, 'laktosefreie Milch holen'
    expectedState = List([
      Map(
        id: 17
        text: 'laktosefreie Milch holen'
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should remove a todo by change its text to an empty string on edit action', ->
    oldState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
      Map(
        id: 18
        text: 'laktosefreie Milch holen'
      )
    ])
    newState = TodoAccess.editTodo oldState, 18, ''
    expectedState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
    ])
    expect(newState).to.equal(expectedState)
