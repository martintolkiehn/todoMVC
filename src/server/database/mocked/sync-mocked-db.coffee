deepcopy = require 'deepcopy'

todos = [
    {
      id: 1
      text: 'Milch holen'
      completed: false
    }
    {
      id: 2
      text: 'Müll runter tragen'
      completed: true
    }
    {
      id: 3
      text: 'Oma Bescheid sagen'
      completed: false
    }
    {
      id: 4
      text: 'Ticket buchen'
      completed: true
    }
]

getNextId = ->
  maxId = 0
  for todo in todos
    maxId = Math.max maxId, (todo?.id ? 0)
  maxId + 1

getTodoIndexById = (id) ->
  return -1 unless id?
  for idx in [0 ... todos.length]
    return idx if id is todos[idx].id
  return -1


getAllTodos = ->
  deepcopy todos

getTodoById = (id) ->
  return null unless id?
  numId = id - 0
  for todo in todos
    return [deepcopy todo] if todo.id is numId
  []

removeTodoById = (id) ->
  return null unless id?
  idx = getTodoIndexById id - 0
  if idx >= 0
    todo = todos[idx]
    todos.splice idx, 1
    return [todo]
  []

saveTodo = (todo) ->
  ownTodo =
    id: todo?.id ? null
    text: todo?.text ? ''
    completed: todo?.completed ? false

  idx = getTodoIndexById todo?.id
  if idx < 0
    ownTodo.id = getNextId()
    todos.push ownTodo
  else
    todos.splice idx, 1, ownTodo

  [deepcopy ownTodo]


saveTodoChanges = (todoChanges) ->
  result =
    removed: []
    changed: []

  if (todoChanges?.removes?.length ? 0) > 0
    for todoRemove in todoChanges.removes
      if todoRemove?.id?
        removed = removeTodoById todoRemove.id
        result.removed.push removed[0] if removed? and (removed?.length ? 0) > 0

  if (todoChanges?.changes?.length ? 0) > 0
    for todoChange in todoChanges.changes
      if todoChange?
        changed = saveTodo todoChange
        result.changed.push changed[0] if changed? and (changed?.length ? 0) > 0

  result

getInfo = ->
  result =
    name: 'mocked'
    isAvailable: false
    error: null
  result.isAvailable = true
  result

module.exports = {
  getAllTodos
  getTodoById
  removeTodoById
  saveTodo
  saveTodoChanges
  getInfo
}
