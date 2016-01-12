React = require 'react'
r = require 'r-dom'

class App extends React.Component

  render: ->
    r.div className:'root'

module.exports = {
  App
}
