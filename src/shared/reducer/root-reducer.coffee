{ combineReducers } = require 'redux'

FilterReducer = require './filter-reducer'
TasksReducer = require './tasks-reducer'

rootReducer = combineReducers {
  tasks: TasksReducer.reduce
  filter: FilterReducer.reduce
}

module.exports.rootReducer = {
  rootReducer
}
