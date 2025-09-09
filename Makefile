INSTALL = install
CURRENT_DATE := $(shell date '+%Y%m%d_%H%M%S')

CONFIG_DIRS = hypr \
							rofi \
							waybar \
							swaync \
							swayosd \
							wleave \
							uwsm \

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to run 'make install' in"
	@echo "hyprland, rofi, waybar, swaync, swayosd and wleave directories."

clean:
	@echo "Cleaning up backup files..."
	@find . -type f -name \*~ -exec rm {} +

# Regel für die Installation
install:
	# Überprüft, ob das Verzeichnis ~/.local/share/hypr25 existiert ODER die Datei lastinstall fehlt.
	@if [ ! -d "$${HOME}/.local/share/hypr25" ] || [ ! -f "$${HOME}/.local/share/hypr25/lastinstall" ]; then \
		echo "Datei ~/.local/share/hypr25/lastinstall nicht gefunden. Erstelle ein Backup ..."; \
		for cdir in $(CONFIG_DIRS); do \
			if [ -d "$${HOME}/.config/$$cdir" ]; then \
				echo "Backup von $$cdir..."; \
				echo "Datum: $(CURRENT_DATE)"; \
				rsync -av "$${HOME}/.config/$$cdir" "$${HOME}/.config/$${cdir}_$(CURRENT_DATE)_hypr25_backup"; \
			fi; \
		done; \
	fi

	# Stellt sicher, dass das Zielverzeichnis existiert (erstellt es, falls nötig)
	@mkdir -p "$${HOME}/.local/share/hypr25"

	# Schreibt das aktuelle Datum und die Uhrzeit in die Datei lastinstall
	@date "+%Y-%m-%d %H:%M:%S" > "$${HOME}/.local/share/hypr25/lastinstall"

	@echo "Installationsdatum wurde in ~/.local/share/hypr25/lastinstall gespeichert."

	cd hyprland && $(MAKE) install
	cd rofi && $(MAKE) install
	cd waybar && $(MAKE) install
	cd swaync && $(MAKE) install
	cd swayosd && $(MAKE) install
	# cd wlogout && $(MAKE) install
	cd wleave && $(MAKE) install
	cd bin && $(MAKE) install
	cd uwsm && $(MAKE) install
	cd desktop && $(MAKE) install

# Regel zum Entfernen der kopierten Dateien
uninstall:
	cd hyprland && $(MAKE) uninstall
	cd rofi && $(MAKE) uninstall
	cd waybar && $(MAKE) uninstall
	cd swaync && $(MAKE) uninstall
	cd swayosd && $(MAKE) uninstall
	# cd wlogout && $(MAKE) uninstall
	cd wleave && $(MAKE) uninstall
	cd bin && $(MAKE) uninstall
	cd uwsm && $(MAKE) uninstall
	cd desktop && $(MAKE) uninstall
