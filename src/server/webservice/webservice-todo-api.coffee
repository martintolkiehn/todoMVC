{ Router } = require 'express'

{ logLevel } = require './../../shared/webservice/webservice-config'

ServiceCore = require './webservice-core'

api = Router()


# get all todos
api.get '/', (req, res) ->
  console.log 'webservice-todo: get all' if logLevel > 0
  ServiceCore.getAllTodosAsync(
  ).then((allTodos) ->
    console.log '=>', allTodos if logLevel > 1
    res.json allTodos
  ).catch((err) ->
    console.log '!=>', err if logLevel > 0
    res.sendStatus 500
  ).finally(->
    res.end()
  )

# get one todo by its id
api.get '/:id', (req, res) ->
  id = req.params.id
  console.log 'webservice-todo: get by id=', id if logLevel > 0
  ServiceCore.getTodoByIdAsync(id
  ).then((todo) ->
    console.log '=>', todo if logLevel > 1
    res.json todo
  ).catch((err) ->
    console.log '!=>', err if logLevel > 0
    res.sendStatus 500
  ).finally(->
    res.end()
  )

# remove one todo by its id
api.delete '/:id', (req, res) ->
  id = req.params.id
  console.log 'webservice-todo: remove by id=', id if logLevel > 0
  ServiceCore.removeTodoByIdAsync(id
  ).then((todo) ->
    console.log '=>', todo if logLevel > 1
    res.json todo
  ).catch((err) ->
    console.log '!=>', err if logLevel > 0
    res.sendStatus 500
  ).finally(->
    res.end()
  )

# save/update one (eventually new) todo
api.post '/', (req, res) ->
  todo = req.body
  console.log 'webservice-todo: post:', (if logLevel > 1 then todo else '') if logLevel > 0
  ServiceCore.saveTodoAsync(todo
  ).then((newTodo) ->
    console.log '=>', newTodo if logLevel > 1
    res.json newTodo
  ).catch((err) ->
    console.log '!=>', err if logLevel > 0
    res.sendStatus 500
  ).finally(->
    res.end()
  )

# save/update multiple todo changes (deletions and updates)
api.post '/*', (req, res) ->
  todoChanges = req.body
  console.log 'webservice-todo: post all changes:', (if logLevel > 1 then todoChanges else '') if logLevel > 0
  ServiceCore.changeTodosAsync(todoChanges
  ).then((newTodoChanges) ->
    console.log '=>', newTodoChanges if logLevel > 1
    res.json newTodoChanges
  ).catch((err) ->
    console.log '!=>', err if logLevel > 0
    res.sendStatus 500
  ).finally(->
    res.end()
  )

module.exports = api
