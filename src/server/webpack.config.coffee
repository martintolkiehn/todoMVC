Path = require 'path'
Webpack = require 'webpack'

module.exports =

  devtool: 'cheap-module-eval-source-map'

  entry: [
    'webpack-hot-middleware/client',
    './src/client/index.coffee'
  ]

  output:
    path: Path.join __dirname, 'dist'
    filename: 'bundle.js'
    publicPath: '/static/'

  plugins: [
    new Webpack.optimize.OccurenceOrderPlugin()
    new Webpack.HotModuleReplacementPlugin()
    new Webpack.NoErrorsPlugin()
  ]
  resolve:
    extensions: [
      ''
      '.js'
      '.coffee'
    ]

  module:
    loaders: [
      {
        test: /\.coffee$/
        loaders: ['react-hot-loader', 'coffee-jsx-loader']
      }
    ]
