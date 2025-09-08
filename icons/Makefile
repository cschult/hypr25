# Definiere die Zieldateien, die kopiert werden sollen
FILES = WhatsApp.png

# Definiere das Zielverzeichnis
TARGET_DIR = $(HOME)/.local/share/icons/hypr25

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the icons."

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere Icons nach $(TARGET_DIR)..."
	# @cp $(FILES) $(TARGET_DIR)/
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@echo "Kopieren abgeschlossen. ✅"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Icons aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
