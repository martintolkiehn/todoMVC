{combineReducers} = require 'redux'
{Map} = require 'immutable'

ToDosReducer = require './todos-reducer'

_reduce = combineReducers {
  todos: ToDosReducer.reduce
}
reduce = (state, action) ->
  Map(_reduce state, action)

module.exports = {
  reduce
}
