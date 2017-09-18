path    = require 'path'
pug     = require './pug'
stylus  = require './stylus'
coffee  = require './coffee'

# Gets the right compiler for the given filename
compiler = (filename) ->
  throw new Error("no filename given") unless filename?
  switch path.extname(filename)
    when '.html'  then pug.compile({filename})
    when '.css'   then stylus.compile({filename})
    when '.js'    then coffee.compile({filename})
    else throw new Error("don't know how to compile #{filename}")

module.exports = compiler
