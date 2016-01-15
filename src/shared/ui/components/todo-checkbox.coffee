React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'

class TodoCheckBox extends Component

  constructor: (props, context) ->
    super props, context

  render: ->
    return (
      <div
        className={
          Classnames(
            checkedBox: @props.checked
            uncheckedBox: not @props.checked
          )
        }
        onClick={=> @props.onClick @props.pos}
      > </div>
    )

  @propTypes:
    onClick: PropTypes.func
    checked: PropTypes.bool
    pos: PropTypes.number.isRequired

module.exports = TodoCheckBox
