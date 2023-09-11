default: build

pre-build:
	mkdir -p dist
	rm -rf dist/*

post-build:
	echo "#!/usr/bin/env node\n" > dist/main
	cat dist/index.js >> dist/main
	chmod +x dist/main
	rm dist/index.js

build: pre-build
	npx swc src/index.ts -o dist/index.js
	make post-build

