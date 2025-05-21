#!/bin/bash

set -e

echo "[+] Installing required packages..."
sudo pacman -S --noconfirm hyprland waybar rofi kitty swww brightnessctl playerctl wf-recorder pipewire wireplumber

echo "[+] Copying configuration files..."
cp -r config/* ~/.config/
cp -r scripts/* ~/.scripts/
chmod +x ~/.scripts/*

echo "[+] Copying wallpaper..."
mkdir -p ~/Pictures/wallpapers
cp -r wallpapers/* ~/Pictures/wallpapers/

echo "[+] Installing Nordzy cursors..."
git clone https://github.com/alvatip/Nordzy-cursors.git /tmp/Nordzy-cursors
mkdir -p ~/.icons
cp -r /tmp/Nordzy-cursors/* ~/.icons/

echo "[+] Setting environment variables for cursor..."
echo 'export XCURSOR_THEME=Nordzy-cursors-white' >> ~/.bashrc
echo 'export XCURSOR_SIZE=32' >> ~/.bashrc
echo 'export HYPRCURSOR_SIZE=24' >> ~/.bashrc

echo "[+] Done! You can now start Hyprland."

