chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect

RootReducer = require '../root-reducer'
RootAccess = require '../root-access'

describe 'root reducer', ->

  it 'has initial state', ->
    oldState = undefined
    action = undefined
    newState = RootReducer.reduce oldState, action
    expectedState = RootAccess.INITIAL_STATE
    expect(newState).to.equal(expectedState)
