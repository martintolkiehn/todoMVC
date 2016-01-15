React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoItem = require './todo-item'

class TodoList extends Component

  constructor: (props, context) ->
    super props, context

  handleRemoveCompleted: () ->
    atLeastOneCompleted = @props.todos.some todo -> todo.get 'completed'
    @props.actions.removeAllCompletedTodos() if atLeastOneCompleted

  renderToggleAll: () ->
    {todos, actions} = @props

    completedCount = todos.reduce(
     (count, todo) ->  count + (if todo.get('completed') then 1 else 0),
     0
    )

    if todos.size > 0
      return (
        <div>
          <input
            className="toggle-all"
            type="checkbox"
            checked={completedCount is todos.size}
            onChange={=> actions.toggleAllTodos todos}
          />
          <label><span></span></label>
        </div>
      )

  # handleShow: (filter) ->
  #   @setState {filter}
  #
  # renderFooter(completedCount)
  #   {todos} = @props
  #   {filter} = @state
  #   activeCount = todos.size - completedCount
  #
  #   if todos.size > 0
  #     return (
  #       <Footer
  #         completedCount={completedCount}
  #         activeCount={activeCount}
  #         filter={filter}
  #         onClearCompleted={@handleRemoveCompleted.bind this}
  #         onShow={@handleShow.bind this}
  #       />
  #     )

  render: ->
    {todos, actions} = @props
    #{filter} = @state

    #filteredTodos = todos.filter TODO_FILTERS[filter]

    return (
      <section className="todoList">
        {@renderToggleAll()}
        <ul>
          {
            todos.map( (todo, pos) ->
              <TodoItem
                key={pos}
                pos={pos}
                todo={todo}
                removeTodo={actions.removeTodo}
                toggleTodo={actions.toggleTodo}
                changeTodoText={actions.changeTodoText}
              />
            )
          }
        </ul>
      </section>
    )

  @propTypes:
    todos: ImmutablePropTypes.list.isRequired
    actions: PropTypes.object.isRequired

module.exports = TodoList
