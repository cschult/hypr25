# Definiere die Zieldateien, die kopiert werden sollen
DESKTOP_FILES = hypr25-firefox_whatsapp.desktop
ICONS = icons/WhatsApp.png

# Setze DATA_HOME auf XDG_DATA_HOME, wenn gesetzt, oder auf $HOME/.local/share
DATA_HOME := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)

# Definiere das Zielverzeichnis
# DESKTOP_DIR = $${HOME}/.local/share/applications
DESKTOP_DIR = $(DATA_HOME)/applications
# ICONS_DIR = $${HOME}/.local/share/icons/hypr25
ICONS_DIR = $(DATA_HOME)/icons/hypr25

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(DESKTOP_DIR)
	@echo "Kopiere Desktop-Dateien nach $(DESKTOP_DIR)..."
	# @cp $(DESKTOP_FILES) $(DESKTOP_DIR)/
	@$(INSTALL) -v --compare -m 644 $(DESKTOP_FILES) $(DESKTOP_DIR)
	@echo "Kopiere Icons nach $(ICONS)"
	@$(INSTALL) -v --compare -m 644 $(ICONS) $(ICONS_DIR)
	@echo "Kopieren abgeschlossen. ✅"
	#bash ../setup/prepare-whatsapp-desktop.sh
	desktop-file-edit --set-icon=$(ICONS_DIR)/WhatsApp.png $(DESKTOP_DIR)/hypr25-firefox_whatsapp.desktop

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
