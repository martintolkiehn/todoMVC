{ Map } = require 'immutable'

createTask = (id, name = '') -> Map({
  id: id
  name: name
  completed: false
})

isValid = (taskState) ->
  try
    taskState and
    Map.isMap(taskState) and
    typeof taskState.get('id') == 'number' and
    taskState.get('id') > 0 and
    typeof taskState.get('name') == 'string' and
    typeof taskState.get('completed') == 'boolean'
  catch
    return false

getId = (taskState) ->
  taskState.get 'id'

getName = (taskState) ->
  taskState.get 'name'

isCompleted = (taskState) ->
  taskState.get 'completed'

rename = (taskState, newName) ->
  taskState.updateIn ['name'], (oldName) -> newName

complete = (taskState) ->
  taskState.updateIn ['completed'], (oldFlag) -> true

uncomplete = (taskState, id) ->
  taskState.updateIn ['completed'], (oldFlag) -> false

toggleCompletion = (taskState, id) ->
  taskState.updateIn ['completed'], (oldFlag) -> !oldFlag

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
