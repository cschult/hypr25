# Definiere die Zieldateien, die kopiert werden sollen
FILES = adwaita-dark.css

# Definiere das Zielverzeichnis
# Setze DATA_HOME auf XDG_DATA_HOME, wenn gesetzt, oder auf $HOME/.local/share
DATA_HOME := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)

TARGET_DIR = $(DATA_HOME)/hypr25

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the style files."

# Regel für die Installation
install: $(TARGET_DIR)
	@echo "Kopiere css-Dateien nach $(TARGET_DIR)..."
	# @cp $(FILES) $(TARGET_DIR)/
	@$(INSTALL) -v --compare -m 644 $(FILES) $(TARGET_DIR)
	@echo "Installation abgeschlossen. ✅"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(TARGET_DIR):
	@mkdir -p $(TARGET_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche css-Dateien aus $(TARGET_DIR)..."
	@rm -f $(addprefix $(TARGET_DIR)/, $(FILES))
	@echo "Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
