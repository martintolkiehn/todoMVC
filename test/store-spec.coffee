{expect} = require 'chai'
{Map,fromJS} = require 'immutable'

{makeStore} = require '../src/store'

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
