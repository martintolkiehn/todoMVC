{List, Map} = require 'immutable'

INITIAL_STATE = List()

createTodo = (text) ->
  Map text: text, completed: false

isValidTodo = (todoState) ->
  isValid = (
    Map.isMap(todoState) and
    (typeof todoState.get('text') is 'string')
  )
  return isValid

isValidTodos = (todosState) ->
  try
    if not List.isList todosState
      return false
    return todosState.every((todoState) -> isValidTodo(todoState))
  catch
    return false

addTodo = (todosState, text) ->
  todosState.push(createTodo text)

editTodo = (todosState, pos, newText) ->
  if newText is ''
    return todosState.filter (todo, itemPos) -> pos isnt itemPos
  else
    return todosState.map (todo, itemPos) ->
      if pos is itemPos then todo.set 'text', newText else todo

deleteTodo = (todosState, pos) ->
  todosState.delete pos

toggleTodo = (todosState, pos) ->
  todosState.map (todo, itemPos) ->
    if pos is itemPos
      todo.update 'completed', (oldFlag) -> not oldFlag
    else
      todo

toggleAllTodos = (todosState) ->
  allCompleted = todosState.every (todo) -> todo.get 'completed'
  todosState.map (todo) ->
    todo.set 'completed', not allCompleted

deleteAllCompletedTodos = (todosState) ->
  todosState.filter (todo) -> not todo.get 'completed'

module.exports = {
  INITIAL_STATE
  createTodo
  isValidTodo
  isValidTodos
  addTodo
  editTodo
  deleteTodo
  toggleTodo
  toggleAllTodos
  deleteAllCompletedTodos
}
