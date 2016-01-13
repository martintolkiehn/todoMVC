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

  it 'should return a new state including the todo given on ADD_TODO action', ->
    action = type: ActionTypes.ADD_TODO, text: 'laktosefreie Milch holen'
    oldState = List([
      Map(
        id: 17
        text: 'Milch holen'
      )
    ])
    newState = TodoReducer.reduce oldState, action
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
