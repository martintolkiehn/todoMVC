React = require 'react'
{ Component, PropTypes } = React
{ bindActionCreators } = require 'redux'
{ connect } = require 'react-redux'
#Header = require '../components/Header'
#MainSection = require '../components/MainSection'
Actions = require '../../action/action'

class App extends Component
  render: ->
    { tasks, actions } = @props
    return (
      <div>
        Karl-Heinz
      </div>
    )

#App.propTypes =
#  tasks: PropTypes.array.isRequired,
#  actions: PropTypes.object.isRequired

mapStateToProps = (state) ->
  return {
    tasks: state.tasks
  }


mapDispatchToProps = (dispatch) ->
  return {
    actions: bindActionCreators Actions, dispatch
  }


module.exports = connect(
  mapStateToProps,
  mapDispatchToProps
)(App)
