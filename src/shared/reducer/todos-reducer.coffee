Actions = require '../action/actions'
ActionTypes = require '../action/action-types'
TodoAccess = require './todo-access'

reduce = (state, action) ->
  console.log 'dispatch action:', action
  return TodoAccess.INITIAL_STATE unless TodoAccess.isValidTodos state

  return state unless Actions.isValid(action)

  switch action.type
    when ActionTypes.ADD_TODO
      return TodoAccess.addTodo state, action.text
    when ActionTypes.CHANGE_TODO_TEXT
      return TodoAccess.changeTodoText state, action.pos, action.id, action.text
    when ActionTypes.REMOVE_TODO
      return TodoAccess.removeTodo state, action.pos, action.id
    when ActionTypes.TOGGLE_TODO
      return TodoAccess.toggleTodo state, action.pos, action.id
    when ActionTypes.TOGGLE_ALL_TODOS
      return TodoAccess.toggleAllTodos state
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
