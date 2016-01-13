{List, Map} = require 'immutable'

INITIAL_STATE = List()

createTodo = (id, text) ->
  Map({id: id, text: text})

isValidTodo = (todoState) ->
  isValid = (
    Map.isMap(todoState) and
    (typeof todoState.get('id') is 'number') and
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
  newId = 1 + (todosState.maxBy((todoState) -> todoState.get('id'))).get('id')
  todosState.push(createTodo newId, text)

editTodo = (todosState, id, newText) ->
  if newText is ''
    return todosState.filter (todo) -> id isnt todo.get 'id'
  else
    return todosState.map (todo) ->
      if id is todo.get 'id' then todo.set 'text', newText else todo

deleteTodo = (todosState, id) ->
  pos = todosState.findIndex((todoState) -> id is todoState.get('id'))
  return todosState if pos < 0
  todosState.delete pos

module.exports = {
  INITIAL_STATE
  createTodo
  isValidTodo
  isValidTodos
  addTodo
  editTodo
  deleteTodo
}
