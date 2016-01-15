rest = require 'rest'
mime = require 'rest/interceptor/mime'

client = rest.wrap mime

ServiceConfig = require './../../shared/webservice/webservice-config'

urlTodoApi = ServiceConfig.url + ServiceConfig.pathTodoApi


get = (path) ->
  client(
    method: 'GET'
    path: urlTodoApi + path
  )

remove = (path) ->
  client(
    method: 'DELETE'
    path: urlTodoApi + path
  )

post = (path, json) ->
  jsonTxt = JSON.stringify(json)
  client(
    method: 'POST'
    path: urlTodoApi + path
    headers:
      'Content-Type': 'application/json'
    entity: json
  )


getAllTodos = ->
  get("/")

getTodoById = (id) ->
  get("/#{id}")

removeTodoById = (id) ->
  remove("/#{id}")

saveTodo = (jsonTodo) ->
  post("/", jsonTodo)

changeTodos = (jsonTodoChanges) ->
  post("/*", jsonTodoChanges)


module.exports = {
  getAllTodos
  getTodoById
  removeTodoById
  saveTodo
  changeTodos
}
