fs    = require 'fs'
path  = require 'path'
glob  = require 'glob'

# Lists the files given by the pattern, and returns a promise which resolves
# to the matching files.
# TODO - should be called something else, as it's not like ls(1)
ls = (pattern) ->
  new Promise (resolve, reject) ->
    glob pattern, (err, files) ->
      resolve(files)


# Reads the contents of filename, returning a promise which resolves to the
# contents.
read = (filename) ->
  new Promise (resolve, reject) ->
    fs.readFile filename, 'utf8', (err, data) ->
      return reject(err) if err?
      resolve data

# Guesses the source-file for a given target filename
source = (filename) ->
  switch path.extname(filename)
    when '.html' then filename.replace(/\.html$/, '.pug')
    when '.css' then filename.replace(/\.css$/, '.styl')
    when '.js' then filename.replace(/\.js$/, '.coffee')
    else throw new Error("Unknown source for #{filename}")

# Gets a function which overwrites or creates the given file. The function
# returns a promise.
write = (filename) ->
  (data) ->
    new Promise (resolve, reject) ->
      fs.writeFile filename, data, 'utf8', (err) ->
        return reject(err) if err?
        resolve()

# Removes the given file, in a promise, which resolves to the filename.
unlink = (filename) ->
  new Promise (resolve, reject) ->
    fs.unlink filename, (err) ->
      return reject(err) if err?
      resolve(filename)

files = { read, write, unlink, ls, source }

# Logs and returns `arg` (for chaining in promises)
log = (arg) ->
  console.log arg
  return arg

module.exports = { files, log }
