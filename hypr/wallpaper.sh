#!/usr/bin/env bash
for i in $(hyprctl monitors | grep -oP '(HDMI-A|DP)-\d+'); do
    hyprctl hyprpaper reload "$i", contain:"$HOME/Pictures/wallpapers/active/$(ls $HOME/Pictures/wallpapers/active | shuf -n 1)"
done
