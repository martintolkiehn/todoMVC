{expect} = require 'chai'
{List, Map} = require 'immutable'

{reduce} = require '../src/reducer'

describe 'reducer test', ->
  describe 'we have a reducer', ->
    it 'reducer exists', -> expect(reduce).to.exist

  describe 'add new task', ->
    it 'add first task on empty task list', ->
      newName = 'Milch holen'
      action = { type: 'ADD_NEW_TASK', name: newName}
      stateOld = []
      stateNew = [
        name: newName, completed: false
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)
