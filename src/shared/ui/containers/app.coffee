React = require 'react'
{ Component, PropTypes } = React
{ bindActionCreators } = require 'redux'
{ connect } = require 'react-redux'
ImmutablePropTypes = require 'react-immutable-proptypes'
#Header = require '../components/Header'
#MainSection = require '../components/MainSection'

Actions = require '../../action/actions'
TodoAdder = require '../components/todo-adder'

class App extends Component
  render: ->
    { todos, actions } = @props
    return (
      <div>
        <TodoAdder  addTodo={actions.addTodo} />
      </div>
    )

  @propTypes:
    todos: ImmutablePropTypes.list #.isRequired
    #actions: ImmutablePropTypes.object.isRequired

mapStateToProps = (state) ->
  console.log state.todos
  return {
    todos: state.todos
  }

mapDispatchToProps = (dispatch) ->
  return {
    actions: bindActionCreators Actions, dispatch
  }

module.exports = connect(
  mapStateToProps,
  mapDispatchToProps
)(App)
