React = require 'react'
{ Component, PropTypes } = React
{ bindActionCreators } = require 'redux'
{ connect } = require 'react-redux'
#Header = require '../components/Header'
#MainSection = require '../components/MainSection'
Actions = require '../../action/actions'

class App extends Component
  render: ->
    { todos, actions } = @props
    return (
      <div>
        Karl-Heinz
      </div>
    )

mapStateToProps = (state) ->
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
