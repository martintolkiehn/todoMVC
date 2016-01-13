ActionTypes = require './action-types'

addTodo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'

module.exports = {
  addTodo
  isValid
}
