Promise = require 'bluebird'
deepcopy = require 'deepcopy'

Database = require '../database/database'


getAllTodosAsync = ->
  Database.getActiveDbModuleAsync(
  ).then( (DbModule) ->
    DbModule.exports.getAllTodosAsync()
  )

getTodoByIdAsync = (id) ->
  Database.getActiveDbModuleAsync(
  ).then( (DbModule) ->
    DbModule.exports.getTodoByIdAsync id
  )

removeTodoByIdAsync = (id) ->
  Database.getActiveDbModuleAsync(
  ).then( (DbModule) ->
    DbModule.exports.removeTodoByIdAsync id
  )

saveTodoAsync = (todo) ->
  Database.getActiveDbModuleAsync(
  ).then( (DbModule) ->
    DbModule.exports.saveTodoAsync todo
  )

changeTodosAsync = (todoChanges) ->
  Database.getActiveDbModuleAsync(
  ).then( (DbModule) ->
    DbModule.exports.saveTodoChangesAsync todoChanges
  )


module.exports = {
  getAllTodosAsync
  getTodoByIdAsync
  removeTodoByIdAsync
  saveTodoAsync
  changeTodosAsync
}
