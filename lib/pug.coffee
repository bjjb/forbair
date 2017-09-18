pug = require 'pug'

compile = (options) ->
  (src) ->
    Promise.resolve(pug.compile(src)(options))

module.exports = { compile }
