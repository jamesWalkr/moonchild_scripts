#!/bin/bash

# Function to install vanilla i3
install_vanilla_i3() {
  echo " installing vanilla i3..."
}

# Function to install cutom i3
install_custom_i3() {
  echo "installing custiom i3..."
}

# Function to prompt user fir installtion choice
prompt_installation_choice() {
  local wm_name="$1"
  echo "$wm_name Installation"
  echo "1. Install $wm_name with no customization"
  echo "2. Install $wm_name with customization"
  echo "3. or hit ENTER to skip"
  read -r choice

  case $choice in
  1)
    echo "Installing $wm_name with no customization"
    ;;
  2)
    echo "Installing $wm_name with customization"
    ;;
  *)
    echo "Skipping installation $wm_name"
    ;;
  esac

  printf "\n\n"
}

# Main Script

# Array to store user choices
declare -A choices

# Prompt for each window manager
prompt_and_store_choice() {
  local wm_name="$1"
  prompt_installation_choice $wm_name
  choices["$wm_name"]=$choice
  # echo "added to choice array: ${choices[$wm_name]}"
}

# Prompt for i3 installation
prompt_and_store_choice "i3"

# Prompt for sway installation
# prompt_and_store_choice "sway"

# Prompt for Hyprland installation
# prompt_and_store_choice "Hyprland"

# chosen wm inside the array
echo "The below window mangers will be installed on you system: "
echo "${!choices[@]}"

printf "\n\n"

# Install based on user choice
for wm_name in "${!choices[@]}"; do
  # echo "WM: ${choices[$wm_name]}"
  case "${choices[$wm_name]}" in
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
