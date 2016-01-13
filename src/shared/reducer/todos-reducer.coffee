Actions = require '../action/actions'
ActionTypes = require '../action/action-types'
TodoAccess = require './todo-access'

reduce = (state, action) ->
  return TodoAccess.INITIAL_STATE unless TodoAccess.isValidTodos state

  return state unless Actions.isValid(action)

  switch action.type
    when ActionTypes.ADD_TODO
      return TodoAccess.addTodo state, action.text
    when ActionTypes.CHANGE_TODO_TEXT
      return TodoAccess.changeTodoText state, action.pos, action.text
    when ActionTypes.DELETE_TODO
      return TodoAccess.deleteTodo state, action.pos
    when ActionTypes.TOGGLE_TODO
      return TodoAccess.toggleTodo state, action.pos
    when ActionTypes.TOGGLE_ALL_TODOS
      return TodoAccess.toggleAllTodos state
    when ActionTypes.DELETE_ALL_COMPLETED_TODOS
      return TodoAccess.deleteAllCompletedTodos state
    else
      return state

module.exports = {
  reduce
}
