chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List} = require 'immutable'

ToDoAccess = require '../todo-access'

describe 'todo state access', ->

  it 'has initial state', ->
    newState = ToDoAccess.INITIAL_STATE
    expectedState = List()
    expect(newState).to.equal(expectedState)

  it 'add todo to list', ->
    text1 = 'Milch holen'
    text2 = 'Butter nicht vergessen'
    todo1 = ToDoAccess.createToDo text1
    todo2 = ToDoAccess.createToDo text2
    oldState = List([
      todo1
    ])
    newState = ToDoAccess.addToDo oldState, text2
    expectedState = List([
      todo1
      todo2
    ])
    expect(newState).to.equal(expectedState)
