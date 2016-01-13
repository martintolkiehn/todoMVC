{ createStore } = require 'redux'
{reduce} = require '../reducer/root-reducer'
{Map} = require 'immutable'

configureStore = (initialState) ->

  validState = reduce()

  store = createStore reduce, validState

  if module.hot
    module.hot.accept '../reducer/root-reducer', () ->
      nextReducer = (require '../reducer/root-reducer').reduce
      store.replaceReducer nextReducer

  return store

module.exports = configureStore
