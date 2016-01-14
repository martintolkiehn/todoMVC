Express = require 'express'
BodyParser = require 'body-parser'

startWebserviceServer = (config) ->
  serviceConfig = config ? require './../../shared/webservice/webservice-config'

  server = Express()
  server.use BodyParser.urlencoded(extended: true)
  server.use BodyParser.json()

  server.use serviceConfig.pathTodoApi, require('./webservice-todo-api')

  server.listen serviceConfig.port, (error) ->
    if error
      console.error error
    else
      console.info "==> 🌎  webservice listening on port #{serviceConfig.port} - #{serviceConfig.url}"

  server

module.exports = {
  startWebserviceServer
}
