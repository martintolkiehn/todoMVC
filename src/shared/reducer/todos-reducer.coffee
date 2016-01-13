Actions = require '../action/actions'
ActionTypes = require '../action/action-types'
TodoAccess = require './todo-access'

reduce = (state, action) ->
  return TodoAccess.INITIAL_STATE unless TodoAccess.isValidTodos state

  return state unless Actions.isValid(action)

  switch action.type
    when ActionTypes.ADD_TODO
      return TodoAccess.addTodo state, action.text
    else
      return state

module.exports = {
  reduce
}
