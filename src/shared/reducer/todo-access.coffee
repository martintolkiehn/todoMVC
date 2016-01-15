{List, Map} = require 'immutable'

INITIAL_STATE = List()

createTodo = (text) ->
  Map text: text, completed: false

isValidTodo = (todoState) ->
  isValid = (
    Map.isMap(todoState) and
    (typeof todoState.get('text') is 'string')
  )
  return isValid

isValidTodos = (todosState) ->
  try
    if not List.isList todosState
      return false
    return todosState.every((todoState) -> isValidTodo(todoState))
  catch
    return false

convertJsonTodo2State = (jsonTodo) ->
  Map(
    id: jsonTodo.id
    text: jsonTodo.text
    completed: jsonTodo.completed
  )

convertJsonTodos2State = (jsonTodos) ->
  for jsonTodo in jsonTodos
    convertJsonTodo2State jsonTodo

mapJsonTodosById = (jsonTodos) ->
  todoById = {}
  for jsonTodo in jsonTodos
    id = jsonTodo?.id
    todoById[id] = jsonTodo if id?
  todoById

mapTodosStateById = (todosState) ->
  todoById = {}
  todosState.forEach (todoState) ->
    id = todoState.get('id')
    todoById[id] = todosState if id?
  todoById


addTodo = (todosState, text) ->
  todosState.push(createTodo text)

changeTodoText = (todosState, pos, newText) ->
  if newText is ''
    return todosState.filter (todo, itemPos) -> pos isnt itemPos
  else
    return todosState.map (todo, itemPos) ->
      if pos is itemPos then todo.set 'text', newText else todo

removeTodo = (todosState, pos, id) ->
  todosState.remove pos, id

toggleTodo = (todosState, pos) ->
  todosState.map (todo, itemPos) ->
    if pos is itemPos
      todo.update 'completed', (oldFlag) -> not oldFlag
    else
      todo

toggleAllTodos = (todosState) ->
  allCompleted = todosState.every (todo) -> todo.get 'completed'
  todosState.map (todo) ->
    todo.set 'completed', not allCompleted

removeAllCompletedTodos = (todosState) ->
  todosState.filter (todo) -> not todo.get 'completed'

receiveAllTodos = (todosState, jsonTodos) ->
  List(convertJsonTodos2State jsonTodos)

receiveTodoChanges = (todosState, jsonTodoChanges) ->
  nextTodosState = todosState

  if (jsonTodoChanges?.removed?.length ? 0) > 0
    jsonTodoById = mapJsonTodosById jsonTodoChanges.removed
    nextTodosState = nextTodosState.filterNot (todoState) -> jsonTodoById[todoState.get('id')]?

  if (jsonTodoChanges?.changed?.length ? 0) > 0
    todoStateById = mapTodosStateById nextTodosState
    added = []
    changed = []
    for jsonTodo in jsonTodoChanges.changed
      if todoStateById?[jsonTodo?.id]?
        changed.push jsonTodo
      else
        added.push jsonTodo


    if added.length > 0
      nextTodosState = nextTodosState.push(convertJsonTodos2State(added)...)

    if changed.length > 0
      jsonTodoById = mapJsonTodosById changed
      console.log '###', changed, jsonTodoChanges
      nextTodosState = nextTodosState.map (todoState) ->
        jsonTodo = jsonTodoById[todoState?.get('id')]
        if jsonTodo? then convertJsonTodo2State(jsonTodo) else todoState

  nextTodosState


module.exports = {
  INITIAL_STATE
  createTodo
  isValidTodo
  isValidTodos
  addTodo
  changeTodoText
  removeTodo
  toggleTodo
  toggleAllTodos
  removeAllCompletedTodos
  receiveAllTodos
  receiveTodoChanges
}
