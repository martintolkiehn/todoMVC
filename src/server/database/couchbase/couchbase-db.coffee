Couchbase = require 'couchbase'
Promise = require 'bluebird'
deepcopy = require 'deepcopy'

DbConfig = require './couchbase-db-config'

cluster = new Couchbase.Cluster DbConfig.connectionString
bucket = cluster.openBucket DbConfig.bucketName, (err) ->
  console.error 'ERROR: problen on open couchbase database', err if err?


defaultDoc =
  todos: [
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


getNextId = (todos) ->
  maxId = 0
  for todo in todos
    maxId = Math.max maxId, (todo?.id ? 0)
  maxId + 1

getTodoIndexById = (todos, id) ->
  return -1 unless id?
  for idx in [0 ... todos.length]
    return idx if id is todos[idx].id
  return -1


getDocAsync= (docId) ->
  new Promise (fulfill, reject) ->
    console.log 'get document:', docId
    bucket.get docId, (error, result) ->
      if error?
        console.log 'error on get document ' + docId, error
        reject error
      else
        fulfill result.value

createDocAsync= (docId, doc) ->
  new Promise (fulfill, reject) ->
    bucket.insert docId, doc, (error, result) ->
      if error?
        console.log 'error on create document ' + docId, error
        reject error
      else
        fulfill null

replaceDocAsync= (docId, doc) ->
  new Promise (fulfill, reject) ->
    bucket.replace docId, doc, (error, result) ->
      if error?
        console.log 'error on replace document ' + docId, error
        reject error
      else
        fulfill null


getAllTodosAsync = ->
  docId = DbConfig.documentId
  getDocAsync(docId
  ).then((result) ->
    result.todos
  ).catch((err) ->
    console.log 'error on read database:', err
    createDocAsync(docId, defaultDoc
    ).then(->
      getDocAsync(docId
      ).then((result) ->
        console.log 'created default document:', result
        result.todos
      )
    )
  )

getTodoByIdAsync = (id) ->
  return Promise.resolve(null) unless id?
  getAllTodosAsync(
  ).then((todos) ->
    numId = id - 0
    for todo in todos
      return [deepcopy todo] if todo.id is numId
    []
  )

removeTodoByIdAsync = (id) ->
  docId = DbConfig.documentId
  return Promise.resolve(null) unless id?
  getAllTodosAsync(
  ).then( (todos) ->
    return [] unless id?

    idx = getTodoIndexById todos, id - 0
    return [] if idx < 0

    todo = todos[idx]
    todos.splice idx, 1

    replaceDocAsync(docId, todos:todos
    ).then(->
      return [todo]
    )
  )

saveTodoAsync = (todo) ->
  console.log 'save todo', todo
  docId = DbConfig.documentId
  return Promise.resolve([]) unless todo?
  getAllTodosAsync(
  ).then( (todos) ->
    console.log 'load todos:', todos
    ownTodo =
      id: todo?.id ? null
      text: todo?.text ? ''
      completed: todo?.completed ? false

    console.log 'own todo', ownTodo

    idx = getTodoIndexById todos, todo?.id
    console.log 'idx found:', idx

    if idx < 0
      ownTodo.id = getNextId todos
      console.log 'new item:', ownTodo
      todos.push ownTodo
    else
      console.log 'replace item on index ', idx
      todos.splice idx, 1, ownTodo

    replaceDocAsync(docId, todos:todos
    ).then(->
      console.log 'todos were updated'
      return [deepcopy ownTodo]
    )
  )



module.exports = {
  getAllTodosAsync
  getTodoByIdAsync
  removeTodoByIdAsync
  saveTodoAsync
}
