# Definiere die Zieldateien, die kopiert werden sollen
FILES = style.css layout.json

# Setze CONFIG_HOME auf XDG_CONFIG_HOME, wenn gesetzt, oder auf $HOME/.config
CONFIG_HOME := $(or $(XDG_CONFIG_HOME),$(HOME)/.config)

# Setze DATA_HOME auf XDG_DATA_HOME, wenn gesetzt, oder auf $HOME/.local/share
DATA_HOME := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)

# Definiere das Zielverzeichnis
TARGET_DIR = $(CONFIG_HOME)/wleave

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(TARGET_DIR)
	if [ ! -f style.css ] || [ style.css -ot style_template.css ]; then \
		cp style_template.css style.css; \
		sed -i "s|DATA_HOME_PLACEHOLDER|$(DATA_HOME)|" style.css; \
	fi
	# cp style_template.css style.css
	# sed -i 's|HOME_PLACEHOLDER|$(HOME)|g' style.css
	@echo "Kopiere Wleave-Konfigurationsdateien nach $(TARGET_DIR)..."
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	#rm style.css
	@echo "Installation abgeschlossen. ✅"
	@echo "Wleave-Konfiguration neu geladen. 🔄"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Wleave-Konfigurationsdateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
