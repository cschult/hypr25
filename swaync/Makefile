# Definiere die Zieldateien, die kopiert werden sollen
FILES = style.css

# Setze CONFIG_HOME auf XDG_CONFIG_HOME, wenn gesetzt, oder auf $HOME/.config
CONFIG_HOME := $(or $(XDG_CONFIG_HOME),$(HOME)/.config)

# Setze DATA_HOME auf XDG_DATA_HOME, wenn gesetzt, oder auf $HOME/.local/share
DATA_HOME := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)

# Definiere das Zielverzeichnis
TARGET_DIR = $(CONFIG_HOME)/swaync

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install swaync config."

# Regel für die Installation
install: $(TARGET_DIR)
	if [ ! -f style.css ] || [ style_template.css -nt style.css ]; then \
		cp style_template.css style.css; \
		sed -i "s|DATA_HOME_PLACEHOLDER|$(DATA_HOME)|" style.css; \
	fi
	@echo "Kopiere Swaync-Konfigurationsdateien nach $(TARGET_DIR)..."
	# @cp $(FILES) $(TARGET_DIR)/
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@echo "Installation abgeschlossen. ✅"
	@echo "Lade swaync-Konfiguration"
	@swaync-client --reload-config
	@swaync-client --reload-css

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Swaync-Konfigurationsdateienn aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
