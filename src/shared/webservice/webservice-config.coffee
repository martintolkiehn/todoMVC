detectedHost = location?.hostname
defaultHost = '127.0.0.1'

protocol = 'http'
host = detectedHost ? defaultHost
port = 3004
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
