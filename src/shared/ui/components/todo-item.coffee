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

  handleSave: (text) ->
    {deleteTodo, changeTodoText, pos} = @props

    if text.length is 0
      deleteTodo pos
    else
      changeTodoText pos, text
    @setState editing: false

  render: ->
    {deleteTodo, toggleTodo, pos} = @props

    element = null
    if @state.editing
      element = (
        <TodoInput
          className="todoAdder"
          text={@props.todo.get 'text'}
          editing={@state.editing}
          onSave={(text) => @handleSave text}
        />
      )
    else
      element = (
        <div className="todoItem">
          <input
            className="todoCompleted"
            type="checkbox"
            checked={@props.todo.get 'completed'}
            onChange={() -> toggleTodo pos}
          />
          <label
            onDoubleClick={@handleDoubleClick.bind this}
          >
            {@props.todo.get 'text'}
          </label>
          <button
            className="todoDelete"
            onClick={() -> deleteTodo pos}
          />
        </div>
      )

    return (
      <li
        className={
          Classnames(
            completed: @props.todo.get 'completed'
            editing: @state.editing
          ) + ' pos' + pos
        }
      >
        {element}
      </li>
    )

  @propTypes:
    changeTodoText: PropTypes.func.isRequired
    deleteTodo: PropTypes.func.isRequired
    toggleTodo: PropTypes.func.isRequired
    todo: ImmutablePropTypes.map.isRequired
    pos: PropTypes.number.isRequired

module.exports = TodoItem
