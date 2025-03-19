#!/bin/bash

gitDirHome=~/gits/tokyoFiles/home
gitDir=~/gits/tokyoFiles/config
conf=~/.config/

echo "Install script for dotfiles"

read -r -p "Do you want to make a backup of your current dotfiles? (if this is a clean install answer no) [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Creating backup of current dotfiles"
  mkdir -p ~/.config/bkup
  sudo tar -czvf ~/.config/bkup/backup.tar.gz $conf/kitty $conf/dunst $conf/fastfetch $conf/hypr $conf/nvim $conf/waybar $conf/wofi $conf/starship.toml ~/.zshrc
else
  echo "Not making a backup of current dotfiles"
fi

read -r -p "Are you SURE that you want to replace your dotfiles? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Alrighty, overwriting."
  cp -r $gitDir/dunst/ $conf
  cp -r $gitDir/fastfetch/ $conf
  cp -r $gitDir/hypr/ $conf
  cp -r $gitDir/nvim/ $conf
  cp -r $gitDir/waybar/ $conf
  cp -r $gitDir/wofi/ $conf
  cp $gitDir/starship.toml $conf
  cp -r $gitDir/kitty/ $conf
  cp $gitDirHome/.zshrc ~
else
  echo "Not overwriting."
fi

read -r -p "Do you want to install dependencies and packages? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Downloading packages"
  sudo pacman --needed -S "$(<pkgs.txt)"
else
  echo "Not installing packages, WARNING, this might make my dotfiles unuseable."
fi

echo "End of install script"
