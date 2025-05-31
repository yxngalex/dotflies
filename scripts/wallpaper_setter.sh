#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

pgrep -x swww >/dev/null || swww init

mapfile -t files < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \))

if [ ${#files[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

file_names=()
for f in "${files[@]}"; do
    file_names+=("$(basename "$f")")
done

CHOICE=$(printf '%s\n' "${file_names[@]}" | wofi --dmenu --prompt "Choose wallpaper:" --lines=10 --allow-clear)

if [ -z "$CHOICE" ]; then
    exit 0
fi

for f in "${files[@]}"; do
    if [[ "$(basename "$f")" == "$CHOICE" ]]; then
        SELECTED_IMAGE="$f"
        break
    fi
done

swww img "$SELECTED_IMAGE" \
    --transition-type any \
    --transition-fps 60 \
    --transition-duration 1 \
    --transition-pos "$(hyprctl cursorpos)"

