{combineReducers} = require 'redux-immutablejs'
{Map} = require 'immutable'

TodosReducer = require './todos-reducer'

reduce = combineReducers {
  todos: TodosReducer.reduce
}

module.exports = {
  reduce
}
