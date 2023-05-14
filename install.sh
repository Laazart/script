#!/bin/bash
#Author: L4z4rt
sysUpdate ()
{
  clear && echo "Actualizando sistema ...."
  sleep 0.5
  sudo pacman -Syy 
  sudo pacman -Syu 
}
reposInstall ()
{
  #--- > Snap repos < ---#
  git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -si
  sudo systemctl enable --now snapd.socket
  sudo ln -s /var/lib/snapd/snap /snap

  #--- > Yay Repos < ---#
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
}

#folderInstall()
#{
#  sudo cp -rf ./dir/fonts /usr/share
#  cp -rf ./dir/config/* ~/.config
#  sudo cp -rf ./dir/onedark.rasi /usr/share/rofi/themes
#}

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
  'discord' 'firefox' 'virtualbox' 'virtualbox-host-modules-arch' 'qemu'
  'virt-manager' 'virt-viewer' 'dnsmasq' 'vde2' 'bridge-utils' 'openbsd-netcat'
  'libguestfs' 'code' 'p7zip'
  )

devPackages=(
  'python3' 'python-pip' 'nodejs' 'npm' 'ts-node'
  'typescript' 'yarn' )

communityPackeges=(
  'zscroll-git' 'unimatrix-git' 'cava' 'evernote-beta-bin'
  'ttf-droid' 'ttf-ms-fonts' # ---- > Fonts
  )

sysUpdate #-----> Actualizacion de sistema
reposInstall #----> Instalacion de repositorios
clear && echo "Instalando herramientas y paquetes"
sleep 0.5
sudo pacman -S -y ${wmPackages[@]} ${toolsPackages[@]} ${devPackages[@]}
yay -S ${communityPackeges[@]}

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
