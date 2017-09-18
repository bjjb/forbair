.PHONY: clean all

cake = ../../node_modules/.bin/cake

targets = index.html style.css app.js

all: $(targets)
%.html: %.pug
	$(cake) $@
%.css: %.styl
	$(cake) $@
%.js: %.coffee
	$(cake) $@
clean:
	rm -rf $(targets)
