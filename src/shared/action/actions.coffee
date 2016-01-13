ActionTypes = require './action-types'

isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'

addTodo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

editTodo = (id, text) ->
  type: ActionTypes.EDIT_TODO
  id: id
  text: text

deleteTodo = (id) ->
  type: ActionTypes.DELETE_TODO
  id: id

completeTodo = (id) ->
  type: ActionTypes.TOGGLE_TODO
  id: id

toggleAllTodos = ->
  type: ActionTypes.TOGGLE_ALL_TODOS

deleteAllCompletedTodos = ->
  type: ActionTypes.DELETE_ALL_COMPLETED_TODOS

module.exports = {
  isValid
  addTodo
  editTodo
  deleteTodo
  completeTodo
  toggleAllTodos
  deleteAllCompletedTodos
}
