detectedHost = location?.host
defaultHost = '127.0.0.1'
ServerConfig = require '../../server/server-config'

protocol = 'http'
host = detectedHost ? defaultHost
port = ServerConfig.port
url = "#{protocol}://#{host}:#{port}"
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
