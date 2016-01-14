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

saveTodo = (jsonTodo) ->
  post("", jsonTodo)

module.exports = {
  getAllTodos
  getTodoById
  saveTodo
}
