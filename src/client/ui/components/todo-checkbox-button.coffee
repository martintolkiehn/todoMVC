React = require 'react'
{ Component, PropTypes } = React
Classnames = require 'classnames'

class TodoCheckBoxButton extends Component

  constructor: (props, context) ->
    super props, context

  render: ->
    classNameMain = ''
    if @props.name then classNameMain = ' ' + @props.name
    return (
      <div
        className={
          Classnames(
            checkedBox: @props.checked
            uncheckedBox: not @props.checked
          ) + classNameMain
        }
        onClick={=> @props.onClick @props.pos}
      > </div>
    )

  @propTypes:
    onClick: PropTypes.func
    checked: PropTypes.bool
    pos: PropTypes.number
    name: PropTypes.string

module.exports = TodoCheckBoxButton
