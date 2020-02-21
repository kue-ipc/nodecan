module.exports = {
  test: /\.coffee(\.erb)?$/,
  use: [{
    loader: 'coffee-loader',
    options: {
      transpile: {
        configFile: "./babel.config.js"
      }
    }
  }]
}
