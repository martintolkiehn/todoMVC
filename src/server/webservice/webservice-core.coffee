Promise = require 'bluebird'
deepcopy = require 'deepcopy'

#Db = require '../database/mocked/mocked-db'
Db = require '../database/couchbase/couchbase-db'


getAllTodosAsync = ->
  Db.getAllTodosAsync()

getTodoByIdAsync = (id) ->
  Db.getTodoByIdAsync id

removeTodoByIdAsync = (id) ->
  Db.removeTodoByIdAsync id

saveTodoAsync = (todo) ->
  Db.saveTodoAsync todo

changeTodosAsync = (todoChanges) ->
  removeProms = []
  changeProms = []

  if (todoChanges?.removes?.length ? 0) > 0
    for todoRemove in todoChanges.removes
      if todoRemove?.id?
        do (_todoRemove = todoRemove) ->
          removeProms.push Promise.try(->
            Db.removeTodoByIdAsync _todoRemove.id
          ).then((removed) ->
            if (removed?.length ? 0) > 0 then removed[0] else null
          )

  if (todoChanges?.changes?.length ? 0) > 0
    for todoChange in todoChanges.changes
      if todoChange?
        do (_todoChange = todoChange) ->
          changeProms.push Promise.try(->
            Db.saveTodoAsync _todoChange
          ).then((changed) ->
            if (changed?.length ? 0) > 0 then changed[0] else null
          )

  return Promise.all(
    [
      Promise.all removeProms
      Promise.all changeProms
    ]
  ).then((results) ->
    console.log 'results->', results
    return {
      removed: results[0]
      changed: results[1]
    }
  )

module.exports = {
  getAllTodosAsync
  getTodoByIdAsync
  removeTodoByIdAsync
  saveTodoAsync
  changeTodosAsync
}
