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
