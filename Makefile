.PHONY: all clean test

coffee 	= node_modules/.bin/coffee
mocha 	= node_modules/.bin/mocha
libs 		= lib/coffee.js lib/stylus.js lib/pug.js lib/util.js lib/express.js

index.js: lib/index.js

lib/index.js: $(libs)

%.js : %.coffee
	$(coffee) -c $<

clean:
	rm -f index.js lib/*.js test/*.file

test:
	$(mocha)
