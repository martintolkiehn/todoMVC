Promise = require 'bluebird'
deepcopy = require 'deepcopy'

Db = require '../database/mocked/mocked-db'
#Db = require '../database/couchbase/couchbase-db'


getAllTodosAsync = ->
  Db.getAllTodosAsync()

getTodoByIdAsync = (id) ->
  Db.getTodoByIdAsync id

removeTodoByIdAsync = (id) ->
  Db.removeTodoByIdAsync id

saveTodoAsync = (todo) ->
  Db.saveTodoAsync todo

changeTodosAsync = (todoChanges) ->
  Db.saveTodoChangesAsync todoChanges


module.exports = {
  getAllTodosAsync
  getTodoByIdAsync
  removeTodoByIdAsync
  saveTodoAsync
  changeTodosAsync
}
