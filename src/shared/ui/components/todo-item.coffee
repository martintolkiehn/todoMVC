React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoInput = require './todo-input'

class TodoItem extends Component

  constructor: (props, context) ->
    super props, context
    @state = editing: false

  handleDoubleClick: ->
    @setState editing: true

  handleSave: (id, text) ->
    if text.length is 0
      @props.deleteTodo id
    else
      @props.editTodo id, text
    @setState editing: false

  render: ->
    { todo, completeTodo, deleteTodo } = @props

    element = null
    if @state.editing
      element = (
        <TodoTextInput
          text={todo.text}
          editing={@state.editing}
          onSave={(text) -> @handleSave todo.id, text}
        />
      )
    else
      element = (
        <div className="todoItem">
          <input
            className="todoCompleted"
            type="checkbox"
            checked={todo.completed}
            onChange={() -> completeTodo todo.id}
          />
          <label
            onDoubleClick={@handleDoubleClick.bind this}
          >
            {todo.text}
          </label>
          <button
            className="todoDelete"
            onClick={() -> deleteTodo todo.id}
          />
        </div>
      )

    return (
      <li
        className={
          Classnames(
            completed: todo.completed
            editing: @state.editing
          )
        }
      >
        {element}
      </li>
    )

  @propTypes:
    editTodo: PropTypes.func.isRequired
    deleteTodo: PropTypes.func.isRequired
    completeTodo: PropTypes.func.isRequired
    todo: ImmutablePropTypes.map.isRequired

module.exports = TodoItem
