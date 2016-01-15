{ createStore } = require 'redux'
{Map} = require 'immutable'

{reduce} = require '../reducer/root-reducer'
{registerStore} = require '../action/actions'
configureStore = (initialState) ->

  validState = reduce()

  store = createStore reduce, validState

  if module.hot
    module.hot.accept '../reducer/root-reducer', () ->
      nextReducer = (require '../reducer/root-reducer').reduce
      store.replaceReducer nextReducer

  registerStore store

  return store

module.exports = configureStore
