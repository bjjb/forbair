{ expect } = require 'chai'

describe 'util', ->
  util = require '../lib/util'
  describe '.files', ->
    { files } = util
    describe '.source', ->
      it 'gets .pug from .html', ->
        expect(files.source('x.html')).to.eql('x.pug')
      it 'gets .styl from .css', ->
        expect(files.source('x.css')).to.eql('x.styl')
      it 'gets .coffee from .js', ->
        expect(files.source('x.js')).to.eql('x.coffee')
    describe '.read', ->
      { read } = files
      before (done) ->
        require('fs').writeFile 'test/test.file', 'ΑΒΓΔΕ', 'utf8', done
      after (done) ->
        require('fs').unlink 'test/test.file', done
      it 'is a function', ->
        expect(read).to.be.a 'function'
      it 'returns a promise', ->
        expect(read('test/test.file')).to.be.an.instanceof Promise
      it 'resolves to the contents of the file', ->
        read('test/test.file').then (s) ->
          expect(s).to.eql 'ΑΒΓΔΕ'
    describe '.write', ->
      { write } = files
      after (done) ->
        require('fs').unlink 'test/test.file', done
      it 'is a function', ->
        expect(write).to.be.a 'function'
      it 'returns a promise', ->
        expect(write('test/test.file')).to.be.a 'function'
      it 'resolves to the content', ->
        write('test/test.file')('αβγδε').then (result) ->
          files.read('test/test.file').then (content) ->
            expect(content).to.eql('αβγδε')
    describe '.unlink', ->
      { unlink } = files
      before (done) ->
        require('fs').writeFile 'test/test.file', 'x', 'utf8', done
      it 'removes a file', ->
        files.unlink('test/test.file')
          .then require('fs').stat 'test/test.file', (err, stat) ->
            expect(err.code).to.eql('ENOENT')
