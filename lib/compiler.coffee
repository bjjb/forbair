path = require 'path'
pug = require './pug'
stylus = require './stylus'
coffee = require './coffee'
# Gets the right compiler for the given filename
compiler = (filename) ->
  switch path.extname(filename)
    when '.html'  then pug.compile({filename})
    when '.css'   then stylus.compile({filename})
    when '.js'    then coffee.compile({filename})
    else raise new Exception("Don't know how to compile #{filename}")

module.exports = compiler
