{expect} = require 'chai'
{List, Map} = require 'immutable'

state = require '../src/state'

describe 'state test', ->
  describe 'we have a state', ->
    it 'state exists', -> expect(state).to.exist

  describe 'add new todo', ->
    it 'add first item on empty todo list', ->
      newName = 'Milch holen'
      stateOld = []
      stateNew = [
        name: newName
      ]
      expect(state.addTask(stateOld, newName)).to.deep.equal(stateNew)
