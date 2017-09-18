// Generated by CoffeeScript 1.12.7
(function() {
  var compile, pug;

  pug = require('pug');

  compile = function(options) {
    return function(src) {
      return Promise.resolve(pug.compile(src)(options));
    };
  };

  module.exports = {
    compile: compile
  };

}).call(this);