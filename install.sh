#!/bin/bash
#Author: L4z4rt
sysUpdate ()
{
  clear && echo "Actualizando sistema ...."
  sleep 0.5
  sudo pacman -Syy > /dev/null 2>&1
  sudo pacman -Syu > /dev/null 2>&1
}

folderInstall()
{
  sudo cp -rf ./dir/fonts /usr/share
  cp -rf ./dir/config/* ~/.config
  sudo cp -rf ./dir/onedark.rasi /usr/share/rofi/themes
}

wmPackages=(
  'bspwm' 'dunst' 'kitty' 
  'picom' 'playerctl' 'polybar' 'rofi' 
  'sxhkd' 'vlc' 'git'
  'wget' 'yarn' 'nitrogen'
)

toolsPackages=(
  'htop' 'bat' 'brightnessctl' 'figlet' 'gnome-screenshot'
  'libreoffice-still-es' 'lsd' 'mdcat' 'mediainfo' 'neofetch' 'neovim'
  'ntfs-3g' 'perl-image-exiftool' 'ripgrep' 'speedtest-cli' 'tree' 'zsh'
  'discord' 'firefox'

  )

devPackages=(
  'python3' 'python-pip' 'nodejs' 'npm' 'ts-node'
  'typescript' 'yarn' )

communityPackeges=(
  'zscroll-git' 'unimatrix-git' 'cava' 'evernote-beta-bin'
  'ttf-droid-20121017-10' 'ttf-ms-fonts' # ---- > Fonts
  )

sysUpdate #-----> Actualizacion de sistema

clear && echo "Instalando herramientas y paquetes"
sleep 0.5
sudo pacman -S -y ${wmPackages[@]} ${toolsPackages[@]} ${devPackages[@]}

clear && echo "Instalando configuraciones"

folderInstall #----> Mover archivos a sus respectivas carpteas


#--- > Snap repos < ---#
git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -si
sudo systemctl enable snapd && sudo systemctl start snapd && 

#--- > Yay Repos < ---#
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
#yay -S -y ${communityPackeges[@]}

