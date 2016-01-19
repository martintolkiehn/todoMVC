Promise = require 'bluebird'

SyncMockedDb = require './sync-mocked-db'

module.exports =
  getAllTodosAsync: ->
    Promise.resolve SyncMockedDb.getAllTodos()

  getTodoByIdAsync: (id) ->
    Promise.resolve SyncMockedDb.getTodoById id

  removeTodoByIdAsync: (id) ->
    Promise.resolve SyncMockedDb.removeTodoById id

  saveTodoAsync: (todo) ->
    Promise.resolve SyncMockedDb.saveTodo todo

  saveTodoChangesAsync: (todoChanges) ->
    Promise.resolve SyncMockedDb.saveTodoChanges todoChanges
