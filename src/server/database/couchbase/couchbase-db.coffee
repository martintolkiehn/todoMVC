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

removeTodoById = (todos, id) ->
  return [] unless id?

  idx = getTodoIndexById todos, id - 0
  return [] if idx < 0

  todo = todos[idx]
  todos.splice idx, 1

  return [todo]

saveTodo = (todos, todo) ->
  return [] unless todo?

  ownTodo =
    id: todo?.id ? null
    text: todo?.text ? ''
    completed: todo?.completed ? false

  idx = getTodoIndexById todos, todo?.id

  if idx < 0
    ownTodo.id = getNextId todos
    todos.push ownTodo
  else
    todos.splice idx, 1, ownTodo

  [ownTodo]


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
  return Promise.resolve(null) unless id?
  getAllTodosAsync(
  ).then( (todos) ->
    removed = removeTodoById todos, id
    replaceDocAsync(DbConfig.documentId, todos:todos
    ).then(->
      removed
    )
  )

saveTodoAsync = (todo) ->
  return Promise.resolve([]) unless todo?
  getAllTodosAsync(
  ).then( (todos) ->
    saved = saveTodo todos, todo
    replaceDocAsync(DbConfig.documentId, todos:todos
    ).then(->
      console.log 'todos were updated'
      saved
    )
  )

saveTodoChangesAsync = (todoChanges) ->
  result =
    removed: []
    changed: []
  return Promise.resolve(result) unless todoChanges?

  getAllTodosAsync(
  ).then( (todos) ->
    if (todoChanges?.removes?.length ? 0) > 0
      for todoRemove in todoChanges.removes
        if todoRemove?.id?
          removed = removeTodoById todos, todoRemove.id
          result.removed.push removed[0] if removed? and (removed?.length ? 0) > 0

    if (todoChanges?.changes?.length ? 0) > 0
      for todoChange in todoChanges.changes
        if todoChange?
          changed = saveTodo todos, todoChange
          result.changed.push changed[0] if changed? and (changed?.length ? 0) > 0

    replaceDocAsync(DbConfig.documentId, todos:todos
    ).then(->
      result
    )
  )


module.exports = {
  getAllTodosAsync
  getTodoByIdAsync
  removeTodoByIdAsync
  saveTodoAsync
  saveTodoChangesAsync
}
