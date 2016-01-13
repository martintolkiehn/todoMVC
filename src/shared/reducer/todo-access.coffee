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
  pos = todosState.findIndex((todoState) -> id is todoState.get('id'))
  return todosState if pos < 0
  unless newText
    todosState.delete pos
  else
    todosState.update(pos, (todoState) -> todoState.update('text', (oldText) -> newText))

module.exports = {
  INITIAL_STATE
  createTodo
  isValidTodo
  isValidTodos
  addTodo
  editTodo
}
