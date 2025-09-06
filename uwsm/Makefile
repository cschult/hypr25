# Definiere die Zieldateien, die kopiert werden sollen
FILES = env

# Definiere das Zielverzeichnis
TARGET_DIR = $(HOME)/.config/uwsm

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to copy the files."

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere Hyprland-Konfigurationsdateien nach $(TARGET_DIR)..."
	# @cp $(FILES) $(TARGET_DIR)/
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@echo "Kopieren abgeschlossen. ✅"
	@echo "Logge Dich erneut ein um die veränderte Konfiguration zu laden."

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Hyprland-Konfigurationsdateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
