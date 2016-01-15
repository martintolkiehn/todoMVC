Couchbase = require 'couchbase'
deepcopy = require 'deepcopy'

connectionString = 'couchbase://127.0.0.1'
bucketName = 'default'
document = 'todo'

cluster = new Couchbase.Cluster connectionString

todos = []

bucket = cluster.openBucket bucketName, (err) ->
  if err?
    console.error 'ERROR'
  else
    bucket.get document, (err, res) ->
      value = res.value
      if value?
        todos = value.todos
        console.log todos

getNextId = ->
  maxId = 0
  for todo in todos
    maxId = Math.max maxId, (todo?.id ? 0)
  maxId + 1

getTodoIndexById = (id) ->
  for idx in [0 ... todos.length]
    return idx if id is todos[idx].id
  return -1


getAllTodos = ->
  deepcopy todos

getTodoById = (id) ->
  numId = id - 0
  for todo in todos
    return [deepcopy todo] if todo.id is numId
  []

saveTodo = (todo) ->
  console.log 'saveTodo:', todo
  ownTodo = deepcopy todo
  idx = getTodoIndexById todo.id
  console.log 'found idx', idx, todos[idx]

  if idx <= 0
    ownTodo.id = getNextId()
    todos.push ownTodo
  else
    todos.splice idx, 1, ownTodo
  console.log 'saveTodo:', todo

  [deepcopy ownTodo]

module.exports = {
  getAllTodos
  getTodoById
  saveTodo
}
