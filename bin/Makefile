# PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

INSTALL = install
DESTDIR = $(PREFIX)/bin
FILES = hypr25-switch-audio-sink.sh

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the hypr25 scripts."

install:
	$(INSTALL) -v --compare -m 755 $(FILES) $(DESTDIR)

uninstall:
	for file in $(FILES); do rm -f $(DESTDIR)/$$file; done
