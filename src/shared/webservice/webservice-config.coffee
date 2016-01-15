detectedHost = location?.hostname
defaultHost = '127.0.0.1'
ServerConfig = require '../../server/server-config'

protocol = 'http'
host = detectedHost ? defaultHost
isHeroku = host.match(/herokuapp.com/)?
port = if isHeroku then (if location?.protocol is 'https:' then 443 else 80) else ServerConfig.port
url = "#{protocol}://#{host}:#{port}"

logLevel = 0

pathTodoApi = '/todo'

module.exports = {
  protocol
  host
  port
  url
  logLevel
  pathTodoApi
}
