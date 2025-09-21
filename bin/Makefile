INSTALL = install

DESTDIR = $${HOME}/.local/bin

FILES = font-list \
				hypr25-toggle-audio-sink \
				hypr25-rofi-switch-audio-sink \
				hypr25-whatsapp-app

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the hypr25 scripts."

install:
	@if [ -d $(DESTDIR) ]; then \
		echo "Directory $(DESTDIR) exists."; \
	else \
		echo "Creating directory $(DESTDIR)..."; \
		mkdir -p $(DESTDIR); \
	fi
	$(INSTALL) -v --compare -m 755 $(FILES) $(DESTDIR)
	bash ../setup/prepare-hypr25-whatsapp-app.sh

uninstall:
	for file in $(FILES); do rm -f $(DESTDIR)/$$file; done
