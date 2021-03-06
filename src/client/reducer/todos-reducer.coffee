Actions = require '../action/actions'
ActionTypes = require '../action/action-types'
TodoAccess = require './todo-access'

reduce = (state, action) ->
  return TodoAccess.INITIAL_STATE unless TodoAccess.isValidTodos state

  return state unless Actions.isValid(action)

  switch action.type
    when ActionTypes.SHOW_ALL_TODOS
      return TodoAccess.showAllTodos state
    when ActionTypes.SHOW_COMPLETED_TODOS
      return TodoAccess.showCompletedTodos state
    when ActionTypes.SHOW_OPEN_TODOS
      return TodoAccess.showOpenTodos state
    when ActionTypes.REMOVE_ALL_COMPLETED_TODOS
      return TodoAccess.removeAllCompletedTodos state
    when ActionTypes.WEBSERVICE_RECEIVE_ALL_TODOS
      return TodoAccess.receiveAllTodos state, action.jsonTodos
    when ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
      return TodoAccess.receiveTodoChanges state, action.jsonTodoChanges
    else
      return state

module.exports = {
  reduce
}
