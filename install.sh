#!/bin/bash

pacman=$(pacman -Q | grep -i pacman | awk '{print$1}' | head -n 1)

# Check if git is installed
if ! command -p git &>/dev/null; then
  echo "Git is not installed. Attempting to install Git..."
  
  # make sure pacman is installed. Use pacman to install Git
  if [[ "$pacman" == "pacman" ]]; then
    sudo pacman -S git
  else
    echo "Cannot install Git automatically using pacman. Please install Git manually, then run this script again."
    exit 1
  fi

  # Check if Git is installed after attempting to install.
  if ! command -p git &>/dev/null; then
    echo "Cannot install Git automatically using pacman. Please install Git manually, then run this script again."
    exit 1
  fi
fi

echo "Git has been successfully installed. Continuing with the script."

# check if yay is installed
if ! command -p yay &>/dev/null; then
  echo "yay is not installed. Attempting to install yay..."

  #Make sure git is installed then, build yay from source
  if command -p git &>/dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  else
    echo "Cannot automatically build yay from source. Please build yay from source manually."
    exit 1
  fi

  # Check if yay is installed after attempting to install.
  if ! command -p yay &>/dev/null; then
    echo "Cannot automatically build yay from source. Please build yay from source manually."
    exit 1
  fi
fi

echo "yay has been successfully installed. Continuing with the script."

# Clone into below repositories into home directory
git clone https://github.com/jamesWalkr/moonchild_scripts ~/moonchild_scripts
# git clone https://github.com/jamesWalkr/.dotfiles ~/moonchild_scripts/.dotfiles

clear

# ~/moonchild_scripts/install_scripts/setup.sh

echo "Done..."
