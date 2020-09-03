build-linux:
	cd ./src && chmod +x ./ink-linux-1.7 && ./ink-linux-1.7 --no-net ./build.ink

build-mac:
	cd ./src && chmod +x ./ink-darwin-1.7 && ./ink-darwin-1.7 --no-net ./build.ink