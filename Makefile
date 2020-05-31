prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/foto" "$(bindir)/"

uninstall:
	rm -rf "$(bindir)/foto"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
