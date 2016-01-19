React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoInput = require './todo-input'
TodoCheckBoxButton = require './todo-checkbox-button'

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
    {pos, toggleTodo, todo} = @props
    toggleTodo pos, todo

  render: ->
    {removeTodo, toggleTodo, pos, todo} = @props

    if @state.editing then return (
      <li className="editingInput">
        <TodoInput
          className="todoAdder"
          text={@props.todo.get 'text'}
          editing={@state.editing}
          onSave={(text) => @handleSave text}
        />
      </li>
    )
    else return (
      <li
        className={
          Classnames(
            completed: @props.todo.get 'completed'
            editing: @state.editing
          ) + ' pos' + pos
        }
      >
        <TodoCheckBoxButton
          pos={pos}
          checked={@props.todo.get 'completed'}
          name="toggleCompletion"
          onClick={() => @handleClick pos, todo}
        />
        <label
          className="inputText"
          onDoubleClick={@handleDoubleClick.bind this}
        >
          <span>{@props.todo.get 'text'}</span>
        </label>
        <TodoCheckBoxButton
          pos={pos}
          checked=false
          name="todoRemove"
          onClick={() => removeTodo pos, todo}
        />
      </li>
      )
  @propTypes:
    changeTodoText: PropTypes.func.isRequired
    removeTodo: PropTypes.func.isRequired
    toggleTodo: PropTypes.func.isRequired
    todo: ImmutablePropTypes.map.isRequired
    pos: PropTypes.number.isRequired

module.exports = TodoItem
