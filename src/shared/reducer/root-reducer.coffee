{ combineReducers } = require 'redux'

FilterReducer = require './filter-reducer'
TasksReducer = require './tasks-reducer'

reducer = combineReducers {
  tasks: TasksReducer.reduce
  filter: FilterReducer.reduce
}

module.exports = reducer
