const { environment } = require('@rails/webpacker')
const merge = require('webpack-merge')

const transpileCoffeeLoaderOptions = {
  transpile: {
    extends: `${__dirname}/../../.babelrc`
  }
}

const CoffeeLoader = environment.loaders.get('coffee')

CoffeeLoader.options = merge(CoffeeLoader.options, transpileCoffeeLoaderOptions)

module.exports = environment
