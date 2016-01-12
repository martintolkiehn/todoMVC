{List, Map} = require 'immutable'

INITIAL_STATE = List()

createToDo = (text) ->
  Map({text: text})

addToDo = (todosState, text) ->
  todosState.push(createToDo text)

isValidToDo = (todoState) ->
  typeof todoState == 'object' and
  typeof todoState.text  == 'string'

isValidToDos = (todosState) ->
  try
    if not List.isList todosState
      return false
    return todosState.every((todoState) -> isValidToDo(todoState))
  catch
    return false

module.exports = {
  INITIAL_STATE
  createToDo
  addToDo
  isValidToDo
  isValidToDos
}
