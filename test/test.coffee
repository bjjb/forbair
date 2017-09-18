{ expect } = require 'chai'
{ exec } = require 'child_process'

describe 'forbair', ->
  forbair = require '../lib'
  it 'has a util module', ->
    expect(forbair.util).to.eql require('../lib/util')
  it 'has a pug module', ->
    expect(forbair.pug).to.eql require('../lib/pug')
  it 'has a stylus module', ->
    expect(forbair.stylus).to.eql require('../lib/stylus')
  it 'has a coffee module', ->
    expect(forbair.coffee).to.eql require('../lib/coffee')
  it 'has a generate function', ->
    expect(forbair.generate).to.be.a 'function'
  it 'has a serve function', ->
    expect(forbair.serve).to.be.a 'function'
  it 'has a compiler function', ->
    expect(forbair.compiler).to.be.a 'function'

describe 'an example project', ->
  oldwd = process.cwd()
  before ->
    process.chdir('test/example')
  after (done) ->
    exec 'make', ['clean'], done
    process.chdir(oldwd)
  it 'works as expected', (done) ->
    exec 'make', ['all'], done
