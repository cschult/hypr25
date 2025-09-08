# Install swayosd

$ sudo pacman -S swayosd
$ sudo systemctl enable --now swayosd-libinput-backend.service

## in hyprland.conf

exec-once = uwsm app -- swayosd-server
bindel = ,XF86AudioRaiseVolume, exec, swayosd-client --output-volume 2
bindel = ,XF86AudioLowerVolume, exec, swayosd-client --output-volume -2
bindel = ,XF86AudioMute, exec, swayosd-client --output-volume mute-toggle
