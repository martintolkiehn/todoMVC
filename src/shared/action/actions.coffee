ActionTypes = require './action-types'

addToDo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'

module.exports = {
  addToDo
  isValid
}
