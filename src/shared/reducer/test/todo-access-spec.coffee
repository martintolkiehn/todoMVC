chai = require 'chai'
chaiImmutable = require 'chai-immutable'
chai.use chaiImmutable
expect = chai.expect
{List} = require 'immutable'

ToDoAccess = require '../todo-access'

describe 'todo state access', ->

  it 'has initial state', ->
    actualState = ToDoAccess.INITIAL_STATE
    expectedState = List()
    expect(actualState).to.equal(expectedState)
