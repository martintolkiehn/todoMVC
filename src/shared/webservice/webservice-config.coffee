detectedHost = location?.hostname
defaultHost = '127.0.0.1'
ServerConfig = require '../../server/server-config'

protocol = 'http'
host = detectedHost ? defaultHost
isHeroku = host.match(/herokuapp.com/)?

console.log isHeroku
console.log ServerConfig.port
console.log location?.protocol

port = if isHeroku then (if location?.protocol is 'https:' then 443 else 80) else ServerConfig.port
console.log port

url = "#{protocol}://#{host}:#{port}"
console.log url

console.log url

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
