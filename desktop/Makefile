# Definiere die Zieldateien, die kopiert werden sollen
DESKTOP_FILES = whatsapp-web-hypr25.desktop
ICONS = icons/WhatsApp.png

# Definiere das Zielverzeichnis
DESKTOP_DIR = $${HOME}/.local/share/applications
ICONS_DIR = $${HOME}/.local/share/icons/hypr25

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(DESKTOP_DIR)
	@echo "Kopiere Desktop-Dateien nach $(DESKTOP_DIR)..."
	@$(INSTALL) -v --compare -m 644 $(DESKTOP_FILES) $(DESKTOP_DIR)
	@echo "Kopiere Icons nach $(ICONS)"
	@$(INSTALL) -v --compare -m 644 $(ICONS) $(ICONS_DIR)
	@echo "Kopieren abgeschlossen. ✅"
	desktop-file-edit --set-icon=$(ICONS_DIR)/WhatsApp.png $(DESKTOP_DIR)/whatsapp-web-hypr25.desktop

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(DESKTOP_DIR):
	@mkdir -p $(DESKTOP_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Desktop-Dateien aus $(DESKTOP_DIR)..."
	@rm -f $(addprefix $(DESKTOP_DIR)/, $(DESKTOP_FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(DESKTOP_DIR)
	@echo "Lösche Icons aus $(ICONS_DIR)..."
	@rm -f $(addprefix $(ICONS_DIR)/, $(ICONS))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(ICONS_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
