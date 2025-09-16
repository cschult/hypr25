INSTALL = install
DESTDIR = $${HOME}/.local/bin
FILES = font-list \
				hypr25-toggle-audio-sink \
				hypr25-whatsapp-app

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the hypr25 scripts."

install:
	$(INSTALL) -v --compare -m 755 $(FILES) $(DESTDIR)
	bash ../setup/prepare-hypr25-whatsapp-app.sh

uninstall:
	for file in $(FILES); do rm -f $(DESTDIR)/$$file; done
