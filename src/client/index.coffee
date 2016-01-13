React = require 'react'
{ render } = require 'react-dom'
{ Provider } = require 'react-redux'
configureStore = require '../shared/store/store'

App = require '../shared/ui/containers/app'

store = configureStore()

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)
