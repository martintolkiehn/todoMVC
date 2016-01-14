deepcopy = require 'deepcopy'

getAllTodos = ->
  []

getTodoById = (id) ->
  []

saveTodo = (todo) ->
  newTodo = deepcopy todo
  newTodo.id = 17
  return [newTodo]

modules.export = {
  getAllTodos
  getTodoById
  saveTodo
}
