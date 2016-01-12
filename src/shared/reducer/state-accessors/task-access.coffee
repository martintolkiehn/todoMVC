Immutable = require 'immutable'

createTask = (id, name = '') ->
  id: id
  name: name
  completed: false

isValid = (taskState) ->
  typeof taskState == 'object' and
  typeof taskState.id == 'number' and taskState.id > 0
  typeof taskState.name == 'string' and
  typeof taskState.completed == 'boolean'

getId = (taskState) ->
  taskState.id

getName = (taskState) ->
  taskState.name

isCompleted = (taskState) ->
  taskState.completed

rename = (taskState, newName) ->
  Immutable.Map(taskState).updateIn(['name'], (oldName) -> newName).toJS()

complete = (taskState) ->
  Immutable.Map(taskState).updateIn(['completed'], (oldFlag) -> true).toJS()

uncomplete = (taskState, id) ->
  Immutable.Map(taskState).updateIn(['completed'], (oldFlag) -> false).toJS()

toggleCompletion = (taskState, id) ->
  Immutable.Map(taskState).updateIn(['completed'], (oldFlag) -> !oldFlag).toJS()

module.exports = {
  createTask
  isValid
  getId
  getName
  isCompleted
  rename
  complete
  uncomplete
  toggleCompletion
}
