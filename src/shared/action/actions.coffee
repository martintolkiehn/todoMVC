ActionTypes = require './action-types'

isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'

addTodo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

editTodo = (pos, text) ->
  type: ActionTypes.EDIT_TODO
  pos: pos
  text: text

deleteTodo = (pos) ->
  type: ActionTypes.DELETE_TODO
  pos: pos

toggleTodo = (pos) ->
  type: ActionTypes.TOGGLE_TODO
  pos: pos

toggleAllTodos = ->
  type: ActionTypes.TOGGLE_ALL_TODOS

deleteAllCompletedTodos = ->
  type: ActionTypes.DELETE_ALL_COMPLETED_TODOS

module.exports = {
  isValid
  addTodo
  editTodo
  deleteTodo
  toggleTodo
  toggleAllTodos
  deleteAllCompletedTodos
}
