# Helpers for building JS from CoffeeScript
coffee = require 'coffee-script'

# Returns a function which will compile coffee-script source buffers to
# JavaScript with the options provided. Typically, you'll pass the filename
# as an option.
compile = (options = {}) ->
  (src) ->
    src = Buffer.from(src).toString('utf8')
    Promise.resolve coffee.compile(src, options)

module.exports = { compile }
