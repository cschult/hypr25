# Definiere die Zieldateien, die kopiert werden sollen
DESKTOP_FILES = hypr25-firefox_whatsapp.desktop

ICONS = icons/WhatsApp.png

# Setze DATA_HOME auf XDG_DATA_HOME, wenn gesetzt, oder auf $HOME/.local/share
DATA_HOME := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)

# Definiere das Zielverzeichnis
APPLICATIONS_DIR = $(DATA_HOME)/applications

ICONS_DIR = $(DATA_HOME)/icons/hypr25

INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the scripts."

# Regel für die Installation
install: $(APPLICATIONS_DIR)
	for file in $(DESKTOP_FILES); do \
		if [ ! -f $(APPLICATIONS_DIR)/$$file ] || [ $$file -nt $(APPLICATIONS_DIR)/$$file ]; then \
			echo "Kopiere $$file nach $(APPLICATIONS_DIR)..."; \
			$(INSTALL) -v --compare -m 644 $$file $(APPLICATIONS_DIR); \
		else \
			echo "$$file ist aktuell, überspringe..."; \
		fi \
	done
	if [ ! -f hypr25-firefox_whatsapp.desktop ] || [ hypr25-firefox_whatsapp_template.desktop -nt hypr25-firefox_whatsapp.desktop ]; then \
		cp hypr25-firefox_whatsapp_template.desktop hypr25-firefox_whatsapp.desktop; \
		desktop-file-edit --set-icon=$(ICONS_DIR)/WhatsApp.png hypr25-firefox_whatsapp.desktop; \
	fi
	@echo "Kopiere Desktop-Dateien nach $(APPLICATIONS_DIR)..."
	@$(INSTALL) -v --compare -m 644 $(DESKTOP_FILES) $(APPLICATIONS_DIR)
	@echo "Kopiere Icons nach $(ICONS)"
	@$(INSTALL) -v --compare -m 644 $(ICONS) $(ICONS_DIR)
	@echo "Kopieren abgeschlossen. ✅"

# Regel zum Erstellen des Zielverzeichnisses, falls es nicht existiert
$(APPLICATIONS_DIR):
	@mkdir -p $(APPLICATIONS_DIR)

# Regel zum Entfernen der kopierten Dateien
uninstall:
	@echo "Lösche Desktop-Dateien aus $(APPLICATIONS_DIR)..."
	@rm -f $(addprefix $(APPLICATIONS_DIR)/, $(DESKTOP_FILES))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(APPLICATIONS_DIR)
	@echo "Lösche Icons aus $(ICONS_DIR)..."
	@rm -f $(addprefix $(ICONS_DIR)/, $(ICONS))
	@echo "Leere Verzeichnisse werden entfernt (falls leer)..."
	@rmdir --ignore-fail-on-non-empty $(ICONS_DIR)
	@echo "Löschvorgang abgeschlossen. 🗑️"
