#!/bin/env bash

if command -v firefox &>/dev/null; then
  firefox -CreateProfile hypr25_whatsapp
else
  echo "no firefox"
  exit 1
fi

_profile=$(grep "Path=.*hypr25_whatsapp" "$HOME"/.mozilla/firefox/profiles.ini | sed 's/Path=//')

app_profile=$(grep 'profile=' "$HOME"/.local/bin/hypr25-whatsapp-app | sed 's/profile=//' | sed 's/"//g')

if [[ $_profile != "$app_profile" ]]; then
  sed -i "s/profile=.*/profile=\"$_profile\"/" "$HOME"/.local/bin/hypr25-whatsapp-app
fi
