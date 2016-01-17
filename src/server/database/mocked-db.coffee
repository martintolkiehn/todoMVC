Promise = require 'bluebird'

SyncMockedDb = require './mock/sync-mocked-db'

delay = 100

module.exports =
  getAllTodosAsync: ->
    Promise.resolve SyncMockedDb.getAllTodos()

  getTodoByIdAsync: (id) ->
    Promise.resolve SyncMockedDb.getTodoById id

  removeTodoByIdAsync: (id) ->
    Promise.resolve SyncMockedDb.removeTodoById id

  saveTodoAsync: (todo) ->
    Promise.resolve SyncMockedDb.saveTodo todo
