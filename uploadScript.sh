#!/bin/bash

source ~/secret.sh

repo=~/gits/tokyoFiles/
repo_link=mango7006/tokyoFiles.git
repo_config=~/gits/tokyoFiles/config/
repo_home=~/gits/tokyoFiles/home/

RED='\033[0;31m'
NC='\033[0m' # No Color
# echo -e "I ${RED}love${NC} Stack Overflow"

echo "Updating github repo for Dotfiles"

read -r -p "Do you want to copy dotfiles to repo? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Copying..."
  cd $repo
  sudo cp ~/.zshrc $repo_home
  sudo cp ~/.config/starship.toml $repo_config
  sudo cp -r ~/.config/dunst/ $repo_config
  sudo cp -r ~/.config/fastfetch/ $repo_config
  sudo cp -r ~/.config/hypr/ $repo_config
  sudo cp -r ~/.config/nvim/ $repo_config
  sudo cp -r ~/.config/waybar/ $repo_config
  sudo cp -r ~/.config/wofi/ $repo_config
  sudo cp -r ~/.config/kitty/ $repo_config
else
  echo "Not Updating dotfiles"
fi

read -r -p "Do you want to push to github? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Pushing to github"
  cd $repo
  git add .
  date=$(date +%b/%d/%H:%M)
  read -r -p "Commit Message: " comMessage
  git commit -m "$comMessage $date"
  git push $gittoken@github.com/$repo_link
else
  echo "Not pushing changes to github"
fi

echo -e "${RED}Script ended${NC}"
