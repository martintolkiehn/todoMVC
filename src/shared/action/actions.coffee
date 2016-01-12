ActionTypes = require './action-types'

addToDo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

isValid = (action) ->
  typeof action = 'object' and
  typeof action.type = 'string'

module.exports = {
  addToDo
  isValid
}
