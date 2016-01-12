{Map} = require 'immutable'
ToDoAccess = require './todo-access'

INITIAL_STATE = Map({
  todos: ToDoAccess.INITIAL_STATE
})

module.exports = {
  INITIAL_STATE
}
