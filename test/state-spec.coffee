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
        name: newName, completed: false
      ]
      expect(state.addTask(stateOld, newName)).to.deep.equal(stateNew)

    it 'add another item on none empty todo list', ->
      newName = 'Aber die Eier nicht vergessen'
      stateOld = [
        {name: 'Milch holen', completed: false}
        {name: 'komischer Task', completed: false}
      ]
      stateNew = [
        {name: 'Milch holen', completed: false}
        {name: 'komischer Task', completed: false}
        {name: newName, completed: false}
      ]
      expect(state.addTask(stateOld, newName)).to.deep.equal(stateNew)

  describe 'delete existing item', ->
    it 'delete first item', ->
      position = 0
      stateOld = [
        name: 'Wurstbrot gegessen', completed: false
      ]
      stateNew = [
      ]
      expect(state.deleteTask(stateOld, position)).to.deep.equal(stateNew)

    it 'delete none existing item', ->
      position = 1
      stateOld = [
      ]
      stateNew = [
      ]
      expect(state.deleteTask(stateOld, position)).to.deep.equal(stateNew)

  describe 'complete existing unclompeted item', ->
    it 'complete item', ->
      position = 1
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: true}
      ]
      expect(state.completeTask(stateOld, position)).to.deep.equal(stateNew)

    it 'complete an completed item item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(state.completeTask(stateOld, position)).to.deep.equal(stateNew)

  describe 'uncomplete existing completed item', ->
    it 'uncomplete completed item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(state.uncompleteTask(stateOld, position)).to.deep.equal(stateNew)

    it 'uncomplete unclompeted item', ->
      position = 1
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(state.uncompleteTask(stateOld, position)).to.deep.equal(stateNew)

  describe 'toggle existing completed item', ->
    it 'toggle completed item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      expect(state.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)

    it 'toggle uncompleted item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
      ]
      expect(state.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)

    it 'toggle noneexisting item', ->
      position = 1
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      expect(state.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)
