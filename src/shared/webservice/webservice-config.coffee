detectedHost = location?.hostname
defaultHost = '127.0.0.1'
ServerConfig = require '../../server/server-config'

protocol = 'http'
host = detectedHost ? defaultHost
port = if process.env.PORT? then null else ServerConfig.port
url = "#{protocol}://#{host}#{if port? then ':' + port else ''}"
logLevel = 2

pathTodoApi = '/todo'

module.exports = {
  protocol
  host
  port
  url
  logLevel
  pathTodoApi
}
