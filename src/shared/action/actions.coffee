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


addTodo = (text) ->
  jsonTodo =
    text: text
    completed: false
  WebserviceClient.saveTodo(jsonTodo).then((response)->
    jsonTodos = response.entity
    if jsonTodos? && jsonTodos.length > 0
      registeredStore.dispatch
        type: ActionTypes.WEBSERVICE_RECEIVE_ADDED_TODO
        jsonTodo: jsonTodos[0]
  ).catch((error) ->
    registeredStore.dispatch(webserviceErrorOccured(error))
  )
  webserviceCallIsRunning 'save new todo item'

changeTodoText = (pos, text) ->
  type: ActionTypes.CHANGE_TODO_TEXT
  pos: pos
  text: text

deleteTodo = (pos) ->
  type: ActionTypes.DELETE_TODO
  pos: pos

toggleTodo = (pos) ->
  type: ActionTypes.TOGGLE_TODO
  pos: pos

toggleAllTodos = ->
  type: ActionTypes.TOGGLE_ALL_TODOS

deleteAllCompletedTodos = ->
  type: ActionTypes.DELETE_ALL_COMPLETED_TODOS


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


module.exports = {
  registerStore
  isValid
  addTodo
  changeTodoText
  deleteTodo
  toggleTodo
  toggleAllTodos
  deleteAllCompletedTodos
  loadAllTodos
}
