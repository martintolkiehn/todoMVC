React = require 'react'
{ Component, PropTypes } = React

TodoInput = require './todo-input'

class TodoAdder extends Component
  handleSave: (text) ->
    unless text.length is 0
      @props.addTodo text

  render: ->
    return (
      <header>
        <h1 onClick={@props.loadAllTodos}>TODO <span className="next">MVC</span></h1>
        <TodoInput
          newTodo
          placeholder="add your todo here!"
          onSave={@handleSave.bind this }
         />
      </header>
    )

  @propTypes:
    addTodo: PropTypes.func.isRequired
    loadAllTodos: PropTypes.func.isRequired

module.exports = TodoAdder
