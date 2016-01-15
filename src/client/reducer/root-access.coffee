{Map} = require 'immutable'
TodoAccess = require './todo-access'

INITIAL_STATE = Map({
  todos: TodoAccess.INITIAL_STATE
})

module.exports = {
  INITIAL_STATE
}
