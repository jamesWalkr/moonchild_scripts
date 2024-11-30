#!/bin/bash

# Check if git is installed
if ! command -s git &>/dev/null; then
  echo "Git is not installed. Attempting to install Git..."

  # Use pacman to install Git
  if command -s pacman &>/dev/null; then
    sudo pacman -S git
  else
    echo "Cannot install Git automatically using pacman. Please install Git manually, then run this script again."
    exit 1
  fi

  # Check if Git is installed after attempting to install.
  if ! command -s git &>/dev/null; then
    echo "Cannot install Git automatically using pacman. Please install Git manually, then run this script again."
    exit 1
  fi
fi

echo "Git has been successfully installed. Continuing with the script."

# check if yay is installed
if ! command -S yay &>/dev/null; then
  echo "yay is not installed. Attempting to install yay..."

  # Build yay from source
  if command -s yay &>/dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  else
    echo "Cannot automatically build yay from source. Please build yay from source manually."
    exit 1
  fi

  # Check if yay is installed after attempting to install.
  if ! command -s yay &>/dev/null; then
    echo "Cannot automatically build yay from source. Please build yay from source manually."
    exit 1
  fi
fi

echo "yay has been successfully installed. Continuing with the script."
