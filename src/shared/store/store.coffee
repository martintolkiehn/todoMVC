{ createStore } = require 'redux'
reducer = require '../reducer/root-reducer'

configureStore = (initialState) ->
  store = createStore reducer, initialState

  if module.hot
    module.hot.accept '../reducer/root-reducer', () ->
      nextReducer = require '../reducer/root-reducer'
      store.replaceReducer nextReducer

  return store

module.exports = configureStore
