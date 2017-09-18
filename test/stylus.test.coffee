{ expect } = require 'chai'

describe 'stylus', ->
  stylus = require '../lib/stylus'
  it 'has a compile function', ->
    expect(stylus.compile).to.be.a 'function'
  describe '.compile(foo: 123)', ->
    f = stylus.compile()
    it 'returns a function', ->
      expect(f).to.be.a 'function'
    describe 'which when called with Stylus', ->
      p = f('body\n  font-size 14px')
      it 'returns a promise', ->
        expect(p).to.be.an.instanceof(Promise)
      it 'which resolves to the compiled CSS', ->
        p.then (r) ->
          expect(r.trim()).to.eql('body {\n  font-size: 14px;\n}')
