# Definiere die Zieldateien, die kopiert werden sollen
FILES = config.jsonc \
				mocha.css \
				modules.json \
				power_menu.xml \
				style.css \
				style.css_grey \
				style.css_old

# Definiere das Zielverzeichnis
TARGET_DIR = $(HOME)/.config/waybar

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere Waybar-Konfigurationsdateien nach $(TARGET_DIR)..."
	# @cp $(FILES) $(TARGET_DIR)/
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@echo "Installation abgeschlossen. ✅"
	@echo "Lade Waybar-Konfigurationsdateien neu..."
	@systemctl --user reload waybar.service
	@echo "Waybar-Konfiguration neu geladen. 🔄"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Waybar-Konfigurationsdateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
