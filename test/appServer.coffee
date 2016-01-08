express = require 'express'

port = 3000
testAppServer = express()
testAppServer.use express.static('./web')
testAppServer.listen port
console.log "test app server listening on port #{port} - http://127.0.0.1:#{port}"
