{ Router } = require 'express'

{ logLevel } = require './../../shared/webservice/webservice-config'

ServiceCore = require './webservice-core'

api = Router()

STATUS_NOT_FOUND = 404

# get all todos
api.get '/', (req, res) ->
  console.log 'webservice-todo: get all' if logLevel > 0
  allTodos = ServiceCore.getAllTodos()
  console.log '=>', allTodos if logLevel > 1
  res.json allTodos

# get one todo
api.get '/:id', (req, res) ->
  id = req.params.id
  console.log 'webservice-todo: get by id=', id if logLevel > 0
  todo = ServiceCore.getTodoById id
  notFound = not todo or todo.length <= 0
  if notFound
    console.log '=>', STATUS_NOT_FOUND if logLevel > 0
    res.sendStatus STATUS_NOT_FOUND
  else
    console.log '=>', todo if logLevel > 1
    res.json todo

# save/update one (eventually new) todo
api.post '/', (req, res) ->
  todo = req.body
  console.log 'webservice-todo: put:', (if logLevel > 1 then todo else '') if logLevel > 0
  newTodos = ServiceCore.saveTodo todo
  console.log '=>', newTodos if logLevel > 1
  res.json newTodos

module.exports = api
