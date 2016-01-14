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

post = (path, data) ->
  client(
    method: 'POST'
    headers:
      Host: ServiceConfig.host
    path: urlTodoApi + path
    body: data
  )

getAllTodos = ->
  get("/")

getTodoById = (id) ->
  get("/#{id}")

saveTodo = (todo) ->
  post("", todo)

module.exports = {
  getAllTodos
  getTodoById
  saveTodo
}
