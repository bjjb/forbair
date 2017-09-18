{ expect } = require 'chai'

describe 'coffee', ->
  coffee = require '../lib/coffee'
  it 'has a compile function', ->
    expect(coffee.compile).to.be.a 'function'
  describe '.compile(bare: yes)', ->
    f = coffee.compile(bare: yes)
    it 'returns a function', ->
      expect(f).to.be.a 'function'
    describe 'which when called with Coffeescript', ->
      p = f('foo')
      it 'returns a promise', ->
        expect(p).to.be.an.instanceof(Promise)
      it 'which resolves to the compiled Javascript', ->
        p.then (r) ->
          expect(r.trim()).to.eql('foo;')
