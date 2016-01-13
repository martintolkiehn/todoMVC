{List, Map} = require 'immutable'

INITIAL_STATE = List()

createTodo = (text) ->
  Map({text: text})

addTodo = (todosState, text) ->
  todosState.push(createTodo text)

isValidTodo = (todoState) ->
  typeof todoState == 'object' and
  typeof todoState.text  == 'string'

isValidTodos = (todosState) ->
  try
    if not List.isList todosState
      return false
    return todosState.every((todoState) -> isValidTodo(todoState))
  catch
    return false

module.exports = {
  INITIAL_STATE
  createTodo
  addTodo
  isValidTodo
  isValidTodos
}
