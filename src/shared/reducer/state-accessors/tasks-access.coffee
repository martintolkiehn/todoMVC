{ List } = require 'immutable'

TaskAccess = require './task-access'
{ reduce } = require '../../util/common-util'

initialState = List()

isValid = (tasksState) ->
  try
    if (not List.isList(tasksState) or
       typeof tasksState.size != 'number' or
       tasksState.size < 0)
      return false
    tasksState.every (taskState) ->
      TaskAccess.isValid taskState
  catch
    return false

createNewTaskId = (tasksState) ->
  1 + tasksState.reduce(
    ((maxId, taskState) -> Math.max maxId, taskState.get('id')),
    0
  )

appendTask = (tasksState, newTask) ->
  tasksState.push(newTask)

addNewTask = (tasksState, name) ->
  newTaskId = createNewTaskId tasksState
  newTask = TaskAccess.createTask newTaskId, name
  return appendTask tasksState, newTask

getTaskPosById = (tasksState, id) ->
  tasksState.findIndex predicate: (opts) ->
    (opts.value.get 'id') is id

renameTask = (tasksState, id, name) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return taskState.update pos, (taskState) ->
    TaskAccess.rename taskState, name

deleteTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return tasksState.delete(pos)

completeTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return taskState.update pos, (taskState) ->
    TaskAccess.complete taskState

uncompleteTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return taskState.update pos, (taskState) ->
    TaskAccess.uncomplete taskState

toggleTaskCompletion = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return taskState.update pos, (taskState) ->
    TaskAccess.toggleCompletion taskState

deleteAllCompletedTasks = (tasksState) ->
  return tasksState.filter (taskState) ->
    return !taskState.completed

module.exports = {
  initialState
  isValid
  createNewTaskId
  appendTask
  addNewTask
  renameTask
  deleteTask
  completeTask
  uncompleteTask
  toggleTaskCompletion
  deleteAllCompletedTasks
}
