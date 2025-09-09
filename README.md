# Hypr25 - my personal hyprland setup

Hypr25 is my personal hyprland setup. It uses catppuccin mocha colors. I have
lazyvim and kitty already set up to use catppuccin mocha colors as well,
so they are not setup by hypr25. Hypr25 uses uwsm for session management.

Parts of the waybar setup and the hypr25-switch-audio-sink are borrowed from omarchy.
The files containing catppuccin mocha color definitions are from
[github.com/catppuccin](https://github.com/catppuccin/), i think.

## Warning

Running make install will overwrite your current hyprland config and some
other config! Therefore, please back up your current config before running
make install.

The main Makefile looks for the file `lastinstall` in `~/local/share/hypr25/` to
determine if you have already installed hypr25 before.
If you have not, it will back up your current config to
`~/.config/[CONFIG_DIR]_[DATE_TIME]_hypr25_backup`.

## Installation

    git clone https://github.com/hypr25.git

    cd hypr25

    make install

Always run `make install` from the top level directory of the repository. It will
call all other makefiles in the correct order.

## Required packages

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
- make
- pavucontrol
- pipewire
- pipewire-pulse
- rofi
- swaync
- swayosd
- uwsm
- waybar
- wireplumber
- wleave (AUR)
- wttrbar (AUR)
- xdg-desktop-portal-hyprland
- waybar-weather (cargo install waybar-weather)
