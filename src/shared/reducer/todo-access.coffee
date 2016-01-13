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

module.exports = {
  INITIAL_STATE
  createTodo
  isValidTodo
  isValidTodos
  addTodo
}
