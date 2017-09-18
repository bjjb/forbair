coffee    = require './lib/coffee'
{ files } = require './lib/util'

['pug', 'coffee', 'stylus', 'util'].forEach (f) ->
  task target, "compile lib/#{f}.js", ->
    files.read("lib/#{f}.coffee")
      .then coffee.compile("lib/#{f}.js")
      .then files.write("lib/#{f}.js")
      .catch console.error
