build-linux:
	cd ./src && chmod +x ./ink-linux-1.7 && ./ink-linux-1.7 ./build.ink

build-mac:
	cd ./src && chmod +x ./ink-darwin-1.7 && ./ink-darwin-1.7 ./build.ink

test-linux:
	cd ./src && chmod +x ./ink-linux-1.7 && ./ink-linux-1.7 ./build.ink && ./ink-linux-1.7 test.ink

test-mac:
	cd ./src && chmod +x ./ink-darwin-1.7 && ./ink-darwin-1.7 ./build.ink && ./ink-darwin-1.7 test.ink
