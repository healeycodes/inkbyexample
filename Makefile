build-linux:
	cd ./src && chmod +x ./ink-linux && ./ink-linux --no-net ./build.ink

build-mac:
	cd ./src && chmod +x ./ink-darwin && ./ink-darwin --no-net ./build.ink