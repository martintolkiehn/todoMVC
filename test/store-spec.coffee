{expect} = require 'chai'
{Map,fromJS} = require 'immutable'

{makeStore} = require '../src/store'

describe 'Store', ->
  it 'initial state', ->
    store = makeStore()
    initialState = []
    expect(store.getState()).to.deep.equal(initialState)
