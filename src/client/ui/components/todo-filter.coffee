React = require 'react'
{ Component, PropTypes } = React
ImmutablePropTypes = require 'react-immutable-proptypes'

TodoCheckBoxButton = require './todo-checkbox-button'

class TodoFilter extends Component

  render: ->
    {todos, actions} = @props
    return (
      <div className="filterFooter">
        <TodoCheckBoxButton
          name="showHideUncompletedTodos"
          onClick={=> actions.showHideUncompletedTodos todos}
        />
        <TodoCheckBoxButton
          name="showHideCompletedTodos"
          onClick={=> actions.showHideCompletedTodos todos}
        />
        <TodoCheckBoxButton
          name="removeAllCompletedTodos"
          onClick={=> actions.removeAllCompletedTodos todos}
        />
      </div>
    )

  @propTypes:
    todos: ImmutablePropTypes.list.isRequired
    actions: PropTypes.object.isRequired

module.exports = TodoFilter
