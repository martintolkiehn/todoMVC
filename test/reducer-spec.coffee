{expect} = require 'chai'
{List, Map} = require 'immutable'

{reduce} = require '../src/reducer'

describe 'reducer test', ->
  describe 'we have a reducer', ->
    it 'reducer exists', -> expect(reduce).to.exist

  describe 'get initial state', ->
    it 'get initial state on undefined state', ->
      action = undefined
      stateOld = undefined
      stateNew = []
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

    it 'get same state on undefined action', ->
      action = undefined
      stateOld = [
        name: 'schlafen gehen', completed: false
      ]
      stateNew = [
        name: 'schlafen gehen', completed: false
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'add new task', ->
    it 'add first task on empty task list', ->
      newName = 'Milch holen'
      action = { type: 'ADD_NEW_TASK', name: newName}
      stateOld = []
      stateNew = [
        name: newName, completed: false
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)
