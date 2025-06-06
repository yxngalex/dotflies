#!/bin/bash

set -e

echo "[+] Installing required packages..."
sudo pacman -S --noconfirm hyprland waybar wofi mako kitty swww brightnessctl playerctl wf-recorder pipewire wireplumber grim slurp swappy thunar

echo "[+] Creating necessary directories..."
mkdir -p ~/.config
mkdir -p ~/.scripts
mkdir -p ~/Pictures/wallpapers
mkdir -p ~/.icons

echo "[+] Copying configuration files..."
cp -r config/* ~/.config/
cp -r scripts/* ~/.scripts/
chmod +x ~/.scripts/*

echo "[+] Copying wallpapers..."
cp -r wallpapers/* ~/Pictures/wallpapers/

echo "[+] Installing Nordzy cursors..."
rm -rf /tmp/Nordzy-cursors
git clone --depth 1 https://github.com/alvatip/Nordzy-cursors.git /tmp/Nordzy-cursors
cp -r /tmp/Nordzy-cursors/* ~/.icons/

echo "[+] Setting environment variables for cursor (avoiding duplicates)..."
for VAR in "export XCURSOR_THEME=Nordzy-cursors-white" \
  "export XCURSOR_SIZE=32" \
  "export HYPRCURSOR_SIZE=24"; do
  grep -qxF "$VAR" ~/.bashrc || echo "$VAR" >>~/.bashrc
done

echo "[+] Done! You can now start Hyprland."
