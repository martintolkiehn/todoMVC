Webpack = require 'webpack'
WebpackDevMiddleware = require 'webpack-dev-middleware'
WebpackHotMiddleware = require 'webpack-hot-middleware'
Express = require 'express'
Path = require 'path'
BodyParser = require 'body-parser'

webStaticPath = Path.resolve __dirname, '..', 'client', 'web-static'

webpackConfig = require './webpack.config'
{ port } = require './server-config'

serviceConfig = require '../shared/webservice/webservice-config'

appServer = new Express()
appServer.use Express.static(webStaticPath)

appServer.get('/', (request, response) -> response.render 'index')

appServer.use BodyParser.urlencoded(extended: true)
appServer.use BodyParser.json()

appServer.use serviceConfig.pathTodoApi, require('./webservice/webservice-todo-api')

webpackCompiler = Webpack(webpackConfig)
appServer.use WebpackDevMiddleware(webpackCompiler,
  noInfo: true
  publicPath: webpackConfig.output.publicPath
)
appServer.use WebpackHotMiddleware(webpackCompiler)

appServer.listen port, (error) ->
  if error
    console.error error
  else
    console.info "==> 🌎  Listening on port #{port}. Open up http://127.0.0.1:#{port} in your browser."
