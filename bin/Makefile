# PREFIX is environment variable, but if it is not set, then set default value
# ifeq ($(PREFIX),)
    # PREFIX := $${HOME}/.local
# endif

INSTALL = install
# DESTDIR = $(PREFIX)/bin
DESTDIR = $${HOME}/.local/bin
FILES = font-list \
				hypr25-switch-audio-sink \
				hypr25-whatsapp-app

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the hypr25 scripts."

install:
	$(INSTALL) -v --compare -m 755 $(FILES) $(DESTDIR)

uninstall:
	for file in $(FILES); do rm -f $(DESTDIR)/$$file; done
