Db = require '../database/mocked-db'

getAllTodos = ->
  Db.getAllTodos()

getTodoById = (id) ->
  Db.getTodoById id

saveTodo = (todo) ->
  Db.saveTodo todo

module.exports = {
  getAllTodos
  getTodoById
  saveTodo
}
