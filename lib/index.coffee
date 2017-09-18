# Index file - exports the Forbair module for easy inclusion.

fs        = require 'fs'
pug       = require './pug'
path      = require 'path'
util      = require './util'
coffee    = require './coffee'
stylus    = require './stylus'
express   = require './express'
compiler  = require './compiler'

# Compiles the given file
generate = (filename) ->
  if typeof filename is 'object' and filename.arguments?.length is 1
    filename = filename.arguments[0]
  util.files.read(util.files.source(filename))
    .then compiler(filename)
    .then util.files.write(filename)

# Starts a server
{ serve, middleware } = express

module.exports = { pug, stylus, coffee, util, compiler, generate, serve, middleware }
