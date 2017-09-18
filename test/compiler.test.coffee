{ expect } = require 'chai'

compiler = require '../lib/compiler'

describe 'compiler', ->
  it 'is a function', ->
    expect(compiler).to.be.a 'function'
  it 'raises an exception if the path is missing', ->
    expect(compiler).to.throw()
  [ [ 'x.html', 'h1 Hello', '<h1>Hello</h1>' ],
    [ 'x.css', 'body\n  color black', 'body {\n  color: #000;\n}\n' ],
    [ 'x.js', 'console.log(yes)', '(function() {\n  console.log(true);\n\n}).call(this);\n' ]
  ].forEach (p) ->
    [ filename, input, output ] = p
    describe "(#{filename})", ->
      it "compiles correctly", ->
        compiler(filename)(input).then (result) ->
          expect(result).to.eql(output)
