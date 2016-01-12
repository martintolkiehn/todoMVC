{List, Map} = require 'immutable'

INITIAL_STATE = List()

createToDo = (text) ->
  Map({text: text})

addToDo = (state, text) ->
  state.push(createToDo text)

module.exports = {
  INITIAL_STATE
  createToDo
  addToDo
}
