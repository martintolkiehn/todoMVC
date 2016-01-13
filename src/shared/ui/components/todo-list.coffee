React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoItem = require './todo-item'

class TodoList extends Component

  constructor: (props, context) ->
    super props, context

  handleDeleteCompleted: () ->
    atLeastOneCompleted = @props.todos.some todo -> todo.completed
    @props.actions.deleteAllCompletedTodos() if atLeastOneCompleted

  # handleShow: (filter) ->
  #   @setState {filter}
  #
  # renderToggleAll: (completedCount) ->
  #   {todos, actions} = @props
  #   if todos.size > 0
  #     return (
  #       <input
  #         className="toggle-all"
  #         type="checkbox"
  #         checked={completedCount is todos.size}
  #         onChange={actions.toggleAllTodos}
  #       />
  #     )
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
  #         onClearCompleted={@handleDeleteCompleted.bind this}
  #         onShow={@handleShow.bind this}
  #       />
  #     )

  render: ->
    {todos, actions} = @props
    #{filter} = @state

    #filteredTodos = todos.filter TODO_FILTERS[filter]
    #completedCount = todos.reduce(
    #  (count, todo) ->  count + (if todo.completed then 1 else 0),
    #  0
    #)

    return (
      <section className="todoList">
        <ul>
          {
            todos.map( (todo) ->
              <TodoItem
                key={todo.id}
                todo={todo}
                {...actions}
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
