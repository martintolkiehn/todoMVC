chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List, Map} = require 'immutable'

TodoAccess = require '../todo-access'

describe 'todo state access', ->

  it 'should has an initial state', ->
    newState = TodoAccess.INITIAL_STATE
    expectedState = List()
    expect(newState).to.equal(expectedState)

  it 'should add a new todo to list', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
    ])
    newState = TodoAccess.addTodo oldState, 'laktosefreie Milch holen'
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should change the text of an existing todo', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
    ])
    newState = TodoAccess.changeTodoText oldState, 0, 'laktosefreie Milch holen'
    expectedState = List([
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should remove an existing todo item by changing to a new empty text', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
    ])
    newState = TodoAccess.changeTodoText oldState, 1, ''
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should remove a todo by its id on remove action', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
    ])
    newState = TodoAccess.removeTodo oldState, 1
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: false
    )
    ])
    expect(newState).to.equal(expectedState)

  it 'should change the complete flag to true on a todo item', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
    ])
    newState = TodoAccess.toggleTodo oldState, 0
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: true
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should change the complete flag to false on a todo item', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: true
      )
    ])
    newState = TodoAccess.toggleTodo oldState, 0
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should change the complete flag to true on all todo items', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: true
      )
      Map(
        text: 'Brot nicht vergessen'
        completed: false
      )
    ])
    newState = TodoAccess.toggleAllTodos oldState
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: true
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: true
      )
      Map(
        text: 'Brot nicht vergessen'
        completed: true
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should change the complete flag to false on all todo items', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: true
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: true
      )
      Map(
        text: 'Brot nicht vergessen'
        completed: true
      )
    ])
    newState = TodoAccess.toggleAllTodos oldState
    expectedState = List([
      Map(
        text: 'Milch holen'
        completed: false
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
      Map(
        text: 'Brot nicht vergessen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)

  it 'should remove all completed todo items', ->
    oldState = List([
      Map(
        text: 'Milch holen'
        completed: true
      )
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
      Map(
        text: 'Brot nicht vergessen'
        completed: true
      )
    ])
    newState = TodoAccess.removeAllCompletedTodos oldState
    expectedState = List([
      Map(
        text: 'laktosefreie Milch holen'
        completed: false
      )
    ])
    expect(newState).to.equal(expectedState)
