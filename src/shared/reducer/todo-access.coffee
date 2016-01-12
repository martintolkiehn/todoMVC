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
  if (typeof todosState != 'object' or
      typeof todosState.length  != 'number')
    return false
  for todoState in todosState
    if not isValidToDo todoState
      return false
  true

module.exports = {
  INITIAL_STATE
  createToDo
  addToDo
  isValidToDo
  isValidToDos
}
