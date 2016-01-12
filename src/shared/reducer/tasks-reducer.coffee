ActionType = require '../action/action-type'
TaskAccess = require './state-accessors/task-access'
TasksAccess = require './state-accessors/tasks-access'
{ isValidConstant } = require '../util/common-util'

module.exports =
  reduce: (tasksState, action) ->

    if not TasksAccess.isValid tasksState
      return TasksAccess.initialState

    if not isValidConstant action.type, ActionType
      return tasksState

    switch action.type

      when ActionType.ADD_NEW_TASK
        return TasksAccess.addNewTask tasksState, action.name

      when ActionType.RENAME_TASK
        return TasksAccess.renameTask tasksState, action.id, action.name

      when ActionType.DELETE_TASK
        return TasksAccess.deleteTask tasksState, action.id

      when ActionType.COMPLETE_TASK
        return TasksAccess.completeTask tasksState, action.id

      when ActionType.UNCOMPLETE_TASK
        return TasksAccess.uncompleteTask tasksState, action.id

      when ActionType.TOGGLE_TASK_COMPLETION
        return TasksAccess.toggleTaskCompletion tasksState, action.id

      when ActionType.DELETE_ALL_COMPLETED_TASKS
        return TasksAccess.deleteAllCompletedTasks tasksState

      else
        return tasksState
