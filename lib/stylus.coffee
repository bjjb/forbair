# Helpers for compiling Stylus into CSS

stylus = require 'stylus'

# Returns a function which compiles Stylus to CSS with the given options
# (typically, at least, the filename of the target CSS file). The resulting
# function returns a promise which resolves to the compiled CSS.
compile = (options = {}) ->
  (src) ->
    new Promise (resolve, reject) ->
      stylus.render src, options, (err, css) ->
        return reject(err) if err?
        resolve css

module.exports = { compile }
