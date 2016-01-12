Actions = require '../action/actions'
ActionTypes = require '../action/action-types'
ToDoAccess = require './todo-access'

reduce = (state, action) ->
  if not ToDoAccess.isValidToDos state
    return ToDoAccess.INITIAL_STATE

  return state unless Actions.isValid(action)

  switch action.type
    when ActionTypes.ADD_TODO
      return ToDoAccess.addToDo state, action.text
    else
      return state

module.exports = {
  reduce
}
