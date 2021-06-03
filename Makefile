build-linux:
	cd ./src && chmod +x ./ink-linux-1.9 && ./ink-linux-1.9 ./build.ink

build-mac:
	cd ./src && chmod +x ./ink-darwin-1.9 && ./ink-darwin-1.9 ./build.ink

build-windows:
	cd ./src && chmod +x ./ink-windows-1.9 && ./ink-windows-1.9 ./build.ink

test-linux:
	cd ./src && chmod +x ./ink-linux-1.9 && ./ink-linux-1.9 ./build.ink && ./ink-linux-1.9 test.ink

test-mac:
	cd ./src && chmod +x ./ink-darwin-1.9 && ./ink-darwin-1.9 ./build.ink && ./ink-darwin-1.9 test.ink

test-windows:
	cd ./src && chmod +x ./ink-windows-1.9 && ./ink-windows-1.9 ./build.ink && ./ink-windows-1.9 test.ink