.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	fcash-wallet-client.min.js

clean:
	rm fcash-wallet-client.js
	rm fcash-wallet-client.min.js

fcash-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

fcash-wallet-client.min.js: fcash-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
