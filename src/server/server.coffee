Webpack = require 'webpack'
WebpackDevMiddleware = require 'webpack-dev-middleware'
WebpackHotMiddleware = require 'webpack-hot-middleware'
Express = require 'express'
Path = require 'path'

webStaticPath = Path.resolve __dirname, '..', 'client', 'web-static'

webpackConfig = require './webpack.config'
{ port } = require './server-config'

appServer = new Express()
appServer.use Express.static(webStaticPath)

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
