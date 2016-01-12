ActionTypes = require './action-types'

addToDo = (text) ->
  type: ActionTypes.ADD_TODO
  text: text

module.exports = {
  addToDo
}
