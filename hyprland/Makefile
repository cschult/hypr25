# Definiere die Zieldateien, die kopiert werden sollen
FILES = autostart.conf \
				bindings.conf \
				hypridle.conf \
				hyprland.conf \
				hyprlock.conf \
				hyprpaper.conf \
				mocha.conf \
				README.md

# Setze CONFIG_HOME auf XDG_CONFIG_HOME, wenn gesetzt, oder auf $HOME/.config
CONFIG_HOME := $(or $(XDG_CONFIG_HOME),$(HOME)/.config)

# Definiere das Zielverzeichnis
TARGET_DIR = $(CONFIG_HOME)/hypr

XDG_PORTAL_TARGET_DIR = $(CONFIG_HOME)/xdg-desktop-portal

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere Hyprland-Konfigurationsdateien nach $(TARGET_DIR)..."
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@$(INSTALL) -v --compare -m 644 portals.conf $(XDG_PORTAL_TARGET_DIR)
	@echo "Installation abgeschlossen. ✅"
	@echo "Lade Hyprland-Konfigurationsdateien neu..."
	@hyprctl reload
	@echo "Hyprland-Konfiguration neu geladen. 🔄"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)
$(XDG_PORTAL_TARGET_DIR):
	@mkdir -p $(XDG_PORTAL_TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Hyprland-Konfigurationsdateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
