# Hypr25 - my personal hyprland setup

Hypr25 is my personal hyprland setup. It uses catppuccin mocha colors. I have
lazyvim and kitty already set up to use catppuccin mocha colors as well,
so they are not setup by hypr25. Hypr25 uses uwsm for session management.

Parts of the waybar setup and the hypr25-switch-audio-sink are borrowed from omarchy.
The files containing catppuccin mocha color definitions are from
[github.com/catppuccin](https://github.com/catppuccin/), i think.

## Warning

Running make install copies files into several folders. This will overwrite your current hyprland config and some
other config! Therefore, please back up your current config before running
make install.

The main Makefile (located in the toplevel dir of this repo) is looking for the file `lastinstall` in `~/local/share/hypr25/` to
determine if you have already installed hypr25 before.
If you have not, it will back up your current config to
`~/.config/[CONFIG_DIR]_[DATE_TIME]_hypr25_backup`.

Affected folders in `~/.config` are:

- hypr
- rofi
- swaync
- swayosd
- uwsm
- waybar
- waybar-weather
- wleave

and `~/.local/share/applications`

## Installation

    git clone git@github.com:cschult/hypr25.git

    cd hypr25

    make install

Always run `make install` from the top level directory of the repository. It will
call all other makefiles in the correct order.

Run these commands after the installation:

    systemctl --user enable --now waybar.service
    systemctl --user enable --now hyprpolkitagent.service
    systemctl --user enable --now hyprpaper.service
    sudo systemctl enable --now swayosd-libinput-backend.service

## Required packages

All packages are from the archlinux repositories or the arch user
repository (AUR), if not specified otherwise.

- adw-gtk-theme
- catppuccin-cursors-mocha (AUR)
- catppuccin-gtk-theme-mocha (AUR)
- firefox
- fontconfig
- hypridle
- hyprland
- hyprlock
- hyprpaper
- hyprpolkitagent
- hyprshot
- kitty
- kvantum
- make
- nwg-look
- papirus-icon-theme
- pavucontrol
- pipewire
- pipewire-pulse
- qt5-wayland
- qt5ct
- qt6-wayland
- qt6ct
- rofi
- swaync
- swayosd
- ttf-hack-nerd
- uwsm
- waybar
- waybar-weather (cargo install waybar-weather)
- wireplumber
- wleave (AUR)
- xdg-desktop-portal-gtk
- xdg-desktop-portal-hyprland

## Theme

For libadwaita gtk4 apps you can use this command:

    exec-once = gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

For GTK3 apps you need to install adw-gtk-theme:

    exec-once = gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"

For a list of cursor themes:

    find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name "cursors"

Set GTK and Hyprland cursor theme:

    exec-once = gsettings set org.gnome.desktop.interface cursor-theme "default"

    <!-- exec-once = hyprctl setcursor Adwaita-dark 24 -->
    exec-once = hyprctl setcursor default 24

For the desktop icon theme (nautilus):

    exec-once = gsettings set org.gnome.desktop.interface "Papirus-Dark"

One can also use GTK-Settings (nwg-look) to set themes, icons and cursors.

For KDE apps you need to install: sudo pacman -S qt5ct qt6ct.
You will need to set dark theme for QT apps from KDE more difficult than
with Gnome. :-)

Run `QT5-Einstellungen` (qt5ct) and `QT6-Einstellungen` (qt6ct) and set:

- Appearance:
  - Style: Adwaita-dark
  - Color Scheme: Style's colors
  - Standard dialogs: XDG Desktop Portal
- Fonts:
  - General: Cantarell 11
  - Fixed width: Adwaita Mono 11
  - Press Button `[+ create fonts.conf]`
- Icon Theme:
  - Papirus-Dark
- Interface:
  - Dialog buttons layout: GNOME
  - Keyboard scheme: GNOME

Set environment variable (hyprland.conf)

    env = QT_QPA_PLATFORMTHEME,qt6ct

Or in uwsm/env:

    export QT_QPA_PLATFORMTHEME=qt6ct
