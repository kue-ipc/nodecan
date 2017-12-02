const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const merge = require('webpack-merge')

const transpileCoffeeLoaderOptions = {
  transpile: {
    extends: `${__dirname}/../../.babelrc`
  }
}

const CoffeeLoader = environment.loaders.get('coffee')

CoffeeLoader.options = merge(CoffeeLoader.options, transpileCoffeeLoaderOptions)

environment.plugins.set(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment
