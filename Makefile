JAVASCRIPTS=	noreferrer.js \
		jquery.noreferrer.js
HTMLS=		demo/demo.html \
		demo/demo-jquery.html

all:	js html

clean:
	rm $(JAVASCRIPTS) $(HTMLS)

js:	$(JAVASCRIPTS)

html:	$(HTMLS)

VPATH = src

.SUFFIXES: .haml .html .coffee .js

.haml.html:
	haml $< > $@

.coffee.js:
	coffee -c -p $< | closure-compiler --js - --js_output_file $@
