ActionTypes = require './action-types'
WebserviceClient = require '../../client/webservice/webservice-client'

registeredStore =
  dispatch: ->

registerStore = (store) ->
  registeredStore = store if store?


isValid = (action) ->
  typeof action is 'object' and
  typeof action.type is 'string'


webserviceCallIsRunning = (info) ->
  type: ActionTypes.WEBSERVICE_CALL_IS_RUNNING
  info: info

webserviceErrorOccured = (info) ->
  type: ActionTypes.WEBSERVICE_ERROR_OCCURED
  info: info


changeTodo = (jsonTodo, info) ->
  WebserviceClient.saveTodo(jsonTodo).then((response)->
    changedJsonTodos = response.entity
    if changedJsonTodos? && changedJsonTodos.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
        jsonTodoChanges:
          changed: changedJsonTodos
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning info ? 'change todo'


loadAllTodos = ->
  WebserviceClient.getAllTodos().then((response)->
    jsonTodos = response.entity
    registeredStore.dispatch
      type: ActionTypes.WEBSERVICE_RECEIVE_ALL_TODOS
      jsonTodos: jsonTodos
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'load all todo items'

addTodo = (text) ->
  jsonTodo =
    text: text
    completed: false

  WebserviceClient.saveTodo(jsonTodo).then((response)->
    addedJsonTodos = response.entity
    if addedJsonTodos? && addedJsonTodos.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
        jsonTodoChanges:
          changed: addedJsonTodos
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'add new todo item'

removeTodo = (pos, todoState) ->
  WebserviceClient.removeTodoById(todoState.get('id')).then((response)->
    removedJsonTodos = response.entity
    if removedJsonTodos? && removedJsonTodos.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
        jsonTodoChanges:
          removed: removedJsonTodos
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'remove todo item'

changeTodoText = (pos, todoState, text) ->
  jsonTodo = todoState.toJS()
  jsonTodo.text = text
  changeTodo jsonTodo, 'change todo text'

changeTodoCompletion = (pos, todoState, completed) ->
  jsonTodo = todoState.toJS()
  jsonTodo.completed = completed
  changeTodo jsonTodo, 'change todo completion'

toggleTodo = (pos, todoState) ->
  changeTodoCompletion pos, todoState, not todoState.get('completed')

toggleAllTodos = (todosState) ->
  setToCompleted = not (todosState.every((todo) -> todo.get('completed')))
  allChanged = []
  todosState.forEach (todoState) ->
    if todoState.get('completed') isnt setToCompleted
      jsonTodo = todoState.toJS()
      jsonTodo.completed = setToCompleted
      allChanged.push jsonTodo
  return {type:''} if allChanged.length <= 0

  WebserviceClient.changeTodos(changes:allChanged).then((response)->
    changedJsonTodos = response.entity
    if changedJsonTodos? && changedJsonTodos?.changed?.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
        jsonTodoChanges:
          changed: changedJsonTodos.changed
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'toggle all todos'

removeAllCompletedTodos = ->
  allRemoved = []
  for todoState in todosState
    if todoState.get('completed')
      jsonTodo.completed = setToCompleted
      allRemoved.push todoState.toJS()
  return {type:''} if allRemoved.length <= 0

  WebserviceClient.changeTodos(deletions:allRemoved).then((response)->
    removedJsonTodos = response.entity
    if removedJsonTodos? && removedJsonTodos?.removed?.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_TODO_CHANGES
        jsonTodoChanges:
          removed: changedJsonTodos.removed
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'toggle all todos'

showHideCompletedTodos = (todoState) ->
  alert('TODO showHideCompletedTodos')

showHideUncompletedTodos = (todoState) ->
  alert('TODO showHideUncompletedTodos')

module.exports = {
  registerStore
  isValid
  loadAllTodos
  addTodo
  removeTodo
  changeTodoText
  changeTodoCompletion
  toggleTodo
  toggleAllTodos
  showHideCompletedTodos
  showHideUncompletedTodos
  removeAllCompletedTodos
}
