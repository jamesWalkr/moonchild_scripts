#!/bin/bash

# Function to install vanilla i3
install_vanilla_i3() {
  echo "installing vanilla i3..."
  bash ~/moonchild_scripts/install_scripts/vanilla_i3.sh
}

install_custom_i3() {
  echo "installing custom i3"
  bash ~/moonchild_scripts/install_scripts/custom_i3.sh
}

# Function to prompt user for istallation choice
prompt_installation_choice() {
  local wm_name="$1"
  echo "$wm_name Installation"
  echo "1. Install $wm_name with no customization"
  echo "2. Install $wm_name with customization"
  echo "3. or hit ENTER to skip"

  case "$choice" in
  1)
    echo "Installing $wm_name with no customization"
    ;;
  2)
    echo "Installing $wm_name with customization"
    ;;
  *)
    echo "Skipping installation if $wm_name"
    ;;
  esac

  echo "\n\n"
}

# Main Script

# Array to store user choices
declare -A choices

# Prompt for each window manger
prompt_and_store_choice() {
  local wm_name="$1"
  prompt_installation_choice $wm_name
  choices["wm_name"]=$choice
}

# Prompt for i3 installation
prompt_and_store_choice "i3"

# Install based on user choice
for wm_name in "${!choices[@]}"; do
  case "${choices["wm_name"]}" in
  1)
    case "$wm_name" in
    "i3")
      install_vanilla_i3
      ;;

    *)
      echo "Installation function not defined for $wm_name"
      ;;
    esac
    ;;

  2)
    case "$wm_name" in
    "i3")
      install_custom_i3
      ;;

    *)
      echo "Installation function not defined for $wm_name"
      ;;
    esac
    ;;
  *)
    echo "Skipping $wm_name installation"
    ;;
  esac

done

echo "All installations completed."
