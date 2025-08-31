# Definiere die Zieldateien, die kopiert werden sollen
FILES = bindings.conf \
        hypridle.conf \
        hyprland.conf \
        hyprlock.conf \
        hyprpaper.conf \
        mocha.conf \
        README.md

# Definiere das Zielverzeichnis
TARGET_DIR = $(HOME)/.config/hypr

.PHONY: install clean

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere Hyprland-Konfigurationsdateien nach $(TARGET_DIR)..."
	@cp $(FILES) $(TARGET_DIR)/
	@echo "Installation abgeschlossen. ✅"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
clean:
	@echo "Lösche Hyprland-Konfigurationsdateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Löschvorgang abgeschlossen. 🗑️"
