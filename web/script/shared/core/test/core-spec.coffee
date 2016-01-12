{expect} = require 'chai'
{List, Map} = require 'immutable'

Core = require '../core'

describe 'core test', ->
  describe 'we have a state', ->
    it 'state exists', -> expect(Core).to.exist

  describe 'add new task', ->
    it 'add first task on empty task list', ->
      newName = 'Milch holen'
      stateOld = []
      stateNew = [
        name: newName, completed: false
      ]
      expect(Core.addTask(stateOld, newName)).to.deep.equal(stateNew)

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
      expect(Core.addTask(stateOld, newName)).to.deep.equal(stateNew)

  describe 'rename task', ->
    it 'rename existing task', ->
      position = 0
      oldName = 'Milch holen'
      newName = 'Milchreis holen'
      stateOld = [
        name: oldName, completed: false
      ]
      stateNew = [
        name: newName, completed: false
      ]
      expect(Core.renameTask(stateOld, position, newName)).to.deep.equal(stateNew)

  describe 'delete existing task', ->
    it 'delete first task', ->
      position = 0
      stateOld = [
        name: 'Wurstbrot gegessen', completed: false
      ]
      stateNew = [
      ]
      expect(Core.deleteTask(stateOld, position)).to.deep.equal(stateNew)

    it 'delete none existing item', ->
      position = 1
      stateOld = [
      ]
      stateNew = [
      ]
      expect(Core.deleteTask(stateOld, position)).to.deep.equal(stateNew)

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
      expect(Core.completeTask(stateOld, position)).to.deep.equal(stateNew)

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
      expect(Core.completeTask(stateOld, position)).to.deep.equal(stateNew)

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
      expect(Core.uncompleteTask(stateOld, position)).to.deep.equal(stateNew)

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
      expect(Core.uncompleteTask(stateOld, position)).to.deep.equal(stateNew)

  describe 'toggle existing completed item', ->
    it 'toggle completed item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: false}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      expect(Core.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)

    it 'toggle uncompleted item', ->
      position = 0
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: false}
      ]
      expect(Core.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)

    it 'toggle noneexisting item', ->
      position = 1
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      stateNew = [
        {name: 'Wurstbrot gegessen', completed: true}
      ]
      expect(Core.toggleTaskCompletion(stateOld, position)).to.deep.equal(stateNew)

  describe 'delete all completed tasks', ->
    it 'delete all completed tasks', ->
      stateOld = [
        {name: 'Wurstbrot gegessen', completed: true}
        {name: 'Krümel weggekratzt', completed: false}
        {name: 'Mund abgeputzt', completed: true}
      ]
      stateNew = [
        {name: 'Krümel weggekratzt', completed: false}
      ]
      expect(Core.deleteAllCompletedTasks(stateOld)).to.deep.equal(stateNew)
