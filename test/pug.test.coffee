{ expect } = require 'chai'

describe 'pug', ->
  pug = require '../lib/pug'
  it 'has a compile function', ->
    expect(pug.compile).to.be.a 'function'
  describe '.compile(foo: 123)', ->
    f = pug.compile(foo: 123)
    it 'returns a function', ->
      expect(f).to.be.a 'function'
    describe 'which when called with Pug', ->
      p = f('h1 Hello, #{foo}')
      it 'returns a promise', ->
        expect(p).to.be.an.instanceof(Promise)
      it 'which resolves to the compiled HTML', ->
        p.then (r) ->
          expect(r.trim()).to.eql('<h1>Hello, 123</h1>')
