Immutable = require 'immutable'

TaskAccess = require './task-access'
{ reduce } = require '../../util/common-util'

initialState = []

isValid = (tasksState) ->
  if (tasksState.constructor.name != 'Array' or
     typeof tasksState.length != 'number' or
     tasksState.length < 0)
    return false
  for taskState in tasksState
    if not TaskAccess.isValid taskState then return false
  true

createNewTaskId = (tasksState) ->
  1 + reduce 0, tasksState, (maxTaskId, taskState) ->
    Math.max(maxTaskId, TaskAccess.getId taskState)

appendTask = (tasksState, newTask) ->
  Immutable.List(tasksState).push(newTask).toJS()

addNewTask = (tasksState, name) ->
  newTaskId = createNewTaskId tasksState
  newTask = TaskAccess.createTask newTaskId, name
  return appendTask tasksState, newTask

getTaskPosById = (tasksState, id) ->
  for taskState, pos in tasksState
    if TaskAccess.getId(taskState) == id
      return pos
  return -1

renameTask = (tasksState, id, name) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return Immutable.List(taskState).update(pos, (taskState) ->
    TaskAccess.rename taskState, name
  ).toJS()

deleteTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return Immutable.List(tasksState).delete(pos).toJS()

completeTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return Immutable.List(taskState).update(pos, (taskState) ->
    TaskAccess.complete taskState
  ).toJS()

uncompleteTask = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return Immutable.List(taskState).update(pos, (taskState) ->
    TaskAccess.uncomplete taskState
  ).toJS()

toggleTaskCompletion = (tasksState, id) ->
  pos = getTaskPosById tasksState, id

  if pos < 0
    return tasksState

  return Immutable.List(taskState).update(pos, (taskState) ->
    TaskAccess.toggleCompletion taskState
  ).toJS()

deleteAllCompletedTasks = (tasksState) ->
  return Immutable.List(tasksState).filter( (taskState) ->
    return !taskState.completed
  ).toJS()

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
