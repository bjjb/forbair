pug = require 'pug'

# Compiles a Pug file, and returns a promise which resolves to the compiled
# HTML.
compile = (options) ->
  (src) ->
    Promise.resolve(pug.compile(src)(options))

module.exports = { compile }
