ActionTypes = require './action-types'

isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'

addTodo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

changeTodoText = (pos, text) ->
  type: ActionTypes.CHANGE_TODO_TEXT
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
  changeTodoText
  deleteTodo
  toggleTodo
  toggleAllTodos
  deleteAllCompletedTodos
}
