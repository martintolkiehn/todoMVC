React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoInput = require './todo-input'
TodoCheckBox = require './todo-checkbox'

class TodoItem extends Component

  constructor: (props, context) ->
    super props, context
    @state = editing: false

  handleDoubleClick: ->
    @setState editing: true

  handleSave: (text) ->
    {removeTodo, changeTodoText, pos, todo} = @props

    if text.length is 0
      removeTodo pos, todo
    else
      changeTodoText pos, todo, text
    @setState editing: false

  handleClick: (pos) ->
    {pos, toggleTodo} = @props
    toggleTodo pos

  render: ->
    {removeTodo, toggleTodo, pos, todo} = @props

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
          <TodoCheckBox
            pos={pos}
            checked={@props.todo.get 'completed'}
            onClick={(pos) => @handleClick pos}
          />
          <label
            className="todoCompletedText"
            onDoubleClick={@handleDoubleClick.bind this}
          >
            <span>{@props.todo.get 'text'}</span>
          </label>
          <button
            className="todoRemove"
            onClick={() -> removeTodo pos, todo}
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
    removeTodo: PropTypes.func.isRequired
    toggleTodo: PropTypes.func.isRequired
    todo: ImmutablePropTypes.map.isRequired
    pos: PropTypes.number.isRequired

module.exports = TodoItem
