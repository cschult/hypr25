# Hypr25 - my personal hyprland setup

Hypr25 is my personal hyprland setup.
Hypr25 uses uwsm for session management. I'm using arch linux, so package names
are from arch and may differ for other linux distributions.

The files containing catppuccin mocha color definitions are from
[github.com/catppuccin](https://github.com/catppuccin/), i think.
Well, actually this setup uses Adwaita colors.

## Tools

Hypr25 comes with some tools:

- hypr25-toggle-audio-sink
- hypr25-rofi-switch-audio-sink
- hypr25-whatsapp-app

They are installed to ~/.local/bin. Make sure that ~/.local/bin is in your PATH.

Hypr25-toggle-audio-sink is a bash script which toggles between two
audio sinks. It fails silently if there are no sinks. It only
can toggle two audio sinks. If there are more than two, it toggles
only two of them. Hypr25-toggle-audio-sink is bound to `CTRL+ALT+L`.

Hypr25-rofi-switch-audio-sink opens a rofi menu to select an audio sink.
It is useful with more than two audio sinks.
The menu opens when clicking on the pulseaudio-section in waybar.
Right mouse button there opens pavucontrol.

Hypr25-whatsapp-app starts whatsapp in a separate window or switches
to an already existing whatsapp window. It is bound to `$mainMod SHIFT W`.

## Warning

Running make install copies files into several folders. This will overwrite your
current hyprland config and some other config! Therefore, please back up your
current config before running make install.

The main Makefile (located in the toplevel dir of this repo) is looking for the
file `lastinstall` in `$XDG_DATA_HOME/hypr25/ or ~/.local/share/hypr25/` to
determine if you have already installed hypr25 before. If that file doesn't exist,
it will back up your current configs to `$XDG_CONFIG_HOME/ or ~/.config/ into
a folder named [CONFIG_DIR]_[DATE_TIME]_hypr25_backup`. So `rofi/` will be
backed up as `rofi_2025-09-22_hypr25_backup`

Affected folders in `~/.config` are:

- hypr
- rofi
- swaync
- swayosd
- uwsm
- waybar
- waybar-weather
- wleave

and also `$XDG_DATA_HOME/applications or ~/.local/share/applications` and `~/.local/bin`.

## Installation

    git clone git@github.com:cschult/hypr25.git

    cd hypr25

    make install

Always run `make install` from the top level directory of the repository. It will
call all other makefiles in the correct order.

Run these commands once after the installation:

      systemctl --user enable --now waybar.service
      systemctl --user enable --now hyprpolkitagent.service
      systemctl --user enable --now hyprpaper.service
      systemctl --user enable --now hypridle.service
      sudo systemctl enable --now swayosd-libinput-backend.service

## Required packages

All packages are from the arch linux repositories or the arch user
repository (AUR), if not specified otherwise.

This list maybe is not complete. I have Gnome desktop installed on my system,
so maybe if you don't have Gnome desktop installed, installing adwaita-fonts
may pull a lot of dependencies. I did not test to install hypr25 on a fresh
arch linux installation.

- adw-gtk-theme
- adwaita-fonts
- catppuccin-cursors-mocha (AUR)
- catppuccin-gtk-theme-mocha (AUR)
- desktop-file-utils
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
- libpulse
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
- rofi-emoji
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

Run `QT5 Settings` (qt5ct) and `QT6 Settings` (qt6ct) and set:

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

## Hints

- To prevent firefox from restoring the previous session, set in about:config

  > browser.sessionstore.resume_from_crash

  to false (double click the line).

  This setting is stored in the firefox profile used for whatsapp, so you other
  profiles are not affected.

- Xdg-desktop-portal-hyprland doesn’t implement a file picker. For that, it is
  recommended to install xdg-desktop-portal-gtk alongside XDPH.

  Edit ~/.config/xdg-desktop-portal/portals.conf as shown here:

  ```
  [preferred]
  default = hyprland;gtk
  ```

This project is licensed under the terms of the MIT license.
