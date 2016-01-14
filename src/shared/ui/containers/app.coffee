React = require 'react'
{ Component, PropTypes } = React
{ bindActionCreators } = require 'redux'
{ connect } = require 'react-redux'
ImmutablePropTypes = require 'react-immutable-proptypes'

Actions = require '../../action/actions'
TodoAdder = require '../components/todo-adder'
TodoList = require '../components/todo-list'

class App extends Component
  render: ->
    {todos, actions} = @props
    return (
      <div className="todoApp">
        <TodoAdder addTodo={actions.addTodo} />
        <TodoList todos={todos} actions={actions} />
      </div>
    )

  @propTypes:
    todos: ImmutablePropTypes.list.isRequired
    actions: PropTypes.object.isRequired

mapStateToProps = (state) ->
  return {
    todos: state.get('todos')
  }

mapDispatchToProps = (dispatch) ->
  return {
    actions: bindActionCreators Actions, dispatch
  }

module.exports = connect(
  mapStateToProps,
  mapDispatchToProps
)(App)
