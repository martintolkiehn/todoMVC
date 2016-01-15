chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List, Map} = require 'immutable'

Actions = require '../../action/actions'
ActionTypes = require '../../action/action-types'
TodoReducer = require '../todos-reducer'
TodoAccess = require '../todo-access'

describe 'todo reducer', ->

  it 'should return initial state on invalid start state', ->
    oldState = undefined
    action = undefined
    newState = TodoReducer.reduce oldState, action
    expectedState = TodoAccess.INITIAL_STATE
    expect(newState).to.equal(expectedState)
  #
  # it 'should return a new state including the todo given on ADD_TODO action', ->
  #   action = type: ActionTypes.ADD_TODO, text: 'laktosefreie Milch holen'
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should change the text of an existing todo', ->
  #   action = type: ActionTypes.CHANGE_TODO_TEXT, pos: 0, text: 'laktosefreie Milch holen'
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should remove an existing todo item by changing to a new empty text', ->
  #   action = type: ActionTypes.CHANGE_TODO_TEXT, pos: 1, text: ''
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should remove a todo by its position on remove action', ->
  #   action = type: ActionTypes.REMOVE_TODO, pos: 1
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #   )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should change the complete flag to true on a todo item', ->
  #   action = type: ActionTypes.TOGGLE_TODO, pos: 0
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should change the complete flag to false on a todo item', ->
  #   action = type: ActionTypes.TOGGLE_TODO, pos: 0
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should change the complete flag to true on all todo items', ->
  #   action = type: ActionTypes.TOGGLE_ALL_TODOS
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'Brot nicht vergessen'
  #       completed: false
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'Brot nicht vergessen'
  #       completed: true
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should change the complete flag to false on all todo items', ->
  #   action = type: ActionTypes.TOGGLE_ALL_TODOS
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'Brot nicht vergessen'
  #       completed: true
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'Brot nicht vergessen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
  #
  # it 'should remove all completed todo items', ->
  #   action = type: ActionTypes.REMOVE_ALL_COMPLETED_TODOS
  #   oldState = List([
  #     Map(
  #       text: 'Milch holen'
  #       completed: true
  #     )
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #     Map(
  #       text: 'Brot nicht vergessen'
  #       completed: true
  #     )
  #   ])
  #   newState = TodoReducer.reduce oldState, action
  #   expectedState = List([
  #     Map(
  #       text: 'laktosefreie Milch holen'
  #       completed: false
  #     )
  #   ])
  #   expect(newState).to.equal(expectedState)
