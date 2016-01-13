React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'

class TodoInput extends Component

  constructor: (props, context) ->
    super props, context
    @state =
      text: @props.text ? ''

  handleSubmit: (e) ->
    text = e.target.value.trim()
    if e.which is 13
      @props.onSave(text)
      if  @props.newTodo
        @setState text: ''

  handleChange: (e) ->
    @setState text: e.target.value

  handleBlur: (e) ->
    unless @props.newTodo
      @props.onSave e.target.value

  render: ->
    return (
      <input
        type="text"
        autoFocus="true"
        value={@state.text}
        placeholder={@props.placeholder}
        onBlur={@handleBlur.bind this}
        onChange={@handleChange.bind this}
        onKeyDown={@handleSubmit.bind this}
        className={
          Classnames (
            edit: @props.editing
            newTodo: @props.newTodo
          )
        }
      />
    )

  @propTypes:
    onSave: PropTypes.func.isRequired
    text: PropTypes.string
    placeholder: PropTypes.string
    editing: PropTypes.bool
    newTodo: PropTypes.bool

module.exports = TodoInput
