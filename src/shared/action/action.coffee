ActionType = require './action-type'
TaskFilter = require './task-filter'

module.exports =

  addNewTask: (name = '') ->
    type: ActionType.ADD_NEW_TASK
    name: name

  renameTask: (id, name = '') ->
    type: ActionType.RENAME_TASK
    id: id
    name: name

  deleteTask: (id) ->
    type: ActionType.DELETE_TASK
    id: id

  completeTask: (id) ->
    type: ActionType.COMPLETE_TASK
    id: id

  uncompleteTask: (id) ->
    type: ActionType.UNCOMPLETE_TASK
    id: id

  toggleTaskCompletion: (id) ->
    type: ActionType.TOGGLE_TASK_COMPLETION
    id: id

  deleteAllCompletedTasks: ->
    type: ActionType.DELETE_ALL_COMPLETED_TASKS

  setTaskFilter: (filter = TaskFilter.SHOW_ALL) ->
    type: ActionType.SET_TASK_FILTER
    filter: filter
