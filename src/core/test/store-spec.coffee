{expect} = require 'chai'
{Map,fromJS} = require 'immutable'

{makeStore} = require '../store'

describe 'Store', ->

  store = makeStore()

  it 'initial state', ->
    initialState = []
    expect(store.getState()).to.deep.equal(initialState)

  it 'dispatch addTask', ->
    newName = 'Milch holen'
    action = { type: 'ADD_NEW_TASK', name: newName}
    stateOld = []
    stateNew = [
      name: newName, completed: false
    ]
    store.dispatch action
    expect(store.getState()).to.deep.equal(stateNew)

  it 'dispatch renameTask', ->
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
    store.dispatch action
    expect(store.getState()).to.deep.equal(stateNew)
