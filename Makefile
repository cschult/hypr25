INSTALL = install

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to run 'make install' in"
	@echo "hyprland, rofi, waybar, swayosd and wlogout directories."

# Regel für die Installation
install:
	# $(MAKE) -C hyprland/make all
	cd hyprland && $(MAKE) install
	cd rofi && $(MAKE) install
	cd waybar && $(MAKE) install
	cd swayosd && $(MAKE) install
	# cd wlogout && $(MAKE) install
	cd wleave && $(MAKE) install

# Regel zum Entfernen der kopierten Dateien
uninstall:
	cd hyprland && $(MAKE) uninstall
	cd rofi && $(MAKE) uninstall
	cd waybar && $(MAKE) uninstall
	cd swayosd && $(MAKE) uninstall
	# cd wlogout && $(MAKE) uninstall
	cd wleave && $(MAKE) uninstall
