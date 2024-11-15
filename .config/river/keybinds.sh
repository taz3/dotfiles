#!/bin/bash

riverctl map normal Super Return spawn kitty
riverctl map normal Super Space spawn fuzzel
riverctl map normal Super W spawn firefox
riverctl map normal Super E spawn "kitty -e zsh -ic yazi"

riverctl map normal Super Q close
riverctl map normal Super+Shift Q exit

riverctl map normal Super J focus-view next
riverctl map normal Super K focus-view previous

riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift K swap previous

riverctl map normal Super Period send-to-output next
riverctl map normal Super Comma send-to-output previous

riverctl map normal Super T zoom

for i in $(seq 1 9); do
  tags=$((1 << ($i - 1)))

  riverctl map normal Super $i set-focused-tags $tags
  riverctl map normal Super+Shift $i set-view-tags $tags
done

riverctl map normal Super S toggle-float
riverctl map normal Super F toggle-fullscreen

riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

riverctl map-pointer normal Super BTN_RIGHT resize-view
riverctl map-pointer normal Super BTN_LEFT move-view

for mode in normal locked; do
  riverctl map $mode None XF86AudioRaiseVolume spawn 'pamixer -i 5'
  riverctl map $mode None XF86AudioLowerVolume spawn 'pamixer -d 5'
  riverctl map $mode None XF86AudioMute spawn 'pamixer --toggle-mute'

  riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
  riverctl map $mode None XF86AudioPlay spawn 'playerctl play-pause'
  riverctl map $mode None XF86AudioPrev spawn 'playerctl previous'
  riverctl map $mode None XF86AudioNext spawn 'playerctl next'

  riverctl map $mode None XF86MonBrightnessUp spawn 'brightnessctl set +5%'
  riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'

  riverctl map $mode Control Space spawn 'dunstctl close'
done

riverctl map normal Super+Shift P spawn "grim -g \"\$(slurp)\" - | wl-copy"
riverctl map normal Super P spawn "grim - | wl-copy"
