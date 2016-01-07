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

  describe 'rename task', ->
    it 'rename existing task', ->
      position = 0
      oldName = 'Milch holen'
      newName = 'Milchreis holen'
      action = {type: 'RENAME_TASK', position: position, name: newName }
      stateOld = [
        name: oldName, completed: false
      ]
      stateNew = [
        name: newName, completed: false
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'delete existing task', ->
    it 'delete first task', ->
      position = 0
      action = {type: 'DELETE_TASK', position: position}
      stateOld = [
        name: 'Wurstbrot gegessen', completed: false
      ]
      stateNew = [
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'complete existing unclompeted item', ->
    it 'complete item', ->
      position = 1
      action = {type: 'COMPLETE_TASK', position: position}
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: true}
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'uncomplete existing completed item', ->
    it 'uncomplete completed item', ->
      position = 0
      action = {type: 'UNCOMPLETE_TASK', position: position}
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'toggle existing completed item', ->
    it 'toggle completed item', ->
      position = 0
      action = {type: 'TOGGLE_TASK_COMPLETION', position: position}
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)

  describe 'delete all completed tasks', ->
    it 'delete all completed tasks', ->
      action = {type: 'DELETE_ALL_COMPLETED_TASKS'}
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
        {name: 'Mund abgeputzt', completed: true}
      ]
      stateNew = [
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(reduce(stateOld, action)).to.deep.equal(stateNew)