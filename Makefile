
debug:
	swift build -c debug

tool:
	swift build -c release

install: tool
	cp .build/release/komapainter /usr/local/bin

