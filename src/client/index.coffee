React = require 'react'
{ render } = require 'react-dom'
{ Provider } = require 'react-redux'

{loadAllTodos} = require './action/actions'
configureStore = require './store/store'

App = require './ui/containers/app'

store = configureStore()

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)

loadAllTodos()
