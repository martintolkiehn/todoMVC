Db = require '../database/mocked-db'


getAllTodos = ->
  Db.getAllTodos()

getTodoById = (id) ->
  Db.getTodoById id

removeTodoById = (id) ->
  Db.removeTodoById id

saveTodo = (todo) ->
  Db.saveTodo todo

changeTodos = (todoChanges) ->
  console.log 'changeTodos', todoChanges
  allRemoved = []
  if (todoChanges?.removes?.length ? 0) > 0
    for todoRemove in todoChanges.removes
      removed = Db.removeTodoById todoDeletion?.id
      allRemoved.push removed[0] if (removed?.length ? 0) > 0

  allChanged = []
  if (todoChanges?.changes?.length ? 0) > 0
    for todoChange in todoChanges.changes
      changed = Db.saveTodo todoChange
      allChanged.push changed[0] if (changed?.length ? 0) > 0
      console.log '#', changed

  return {
    removed: allRemoved
    changed: allChanged
  }


module.exports = {
  getAllTodos
  getTodoById
  removeTodoById
  saveTodo
  changeTodos
}
