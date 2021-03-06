_site: boomshak.js
	yarn eleventy

all: test boomshak.js boomshak.d.ts _site

boomshak.d.ts: node_modules
	yarn tsc --emitDeclarationOnly true

boomshak.js: node_modules
	yarn tsc --declaration false

clean:
	rm -rf _site
	rm -f boomshak.d.ts
	rm -f boomshak.js

distclean: clean
	rm -rf node_modules
	rm -f yarn-error.log

node_modules:
	yarn --pure-lockfile

test: node_modules
	yarn jest

.PHONY: all clean distclean test
