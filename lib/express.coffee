pug = require './pug'
glob = require 'glob'
util = require './util'
stylus = require './stylus'
coffee = require './coffee'
morgan = require 'morgan'
express = require 'express'
libpath  = require 'path'
compiler = require './compiler'

middleware = (dir) ->
  (req, res, next) ->
    { path, method } = req
    return next() unless method is 'GET'
    path = path[1..-1] if path[0] is '/'
    path = 'index.html' if path is ''
    util.files.read(util.files.source(path))
      .then compiler(path)
      .then (result) ->
        res.status(200)
        res.end(result)
      .catch (err) ->
        console.error err
        next()

serve = () ->
  dir = '.'
  try
    { name, version } = require "#{process.cwd()}/package"
  catch e
    console.error "WARNING: couldn't load package.json"

  app = express()
  app.use morgan('tiny')
  app.use express.static(dir)
  app.use middleware(dir)
  app.listen process.env.PORT ? 8080, ->
    { address, port } = @address()
    console.log "#{name} v#{version} listening on #{address}:#{port}"

module.exports = { serve, middleware }
