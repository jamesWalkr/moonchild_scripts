#!/bin/bash

# An arch linux install script

# Verify Boot Mode
echo "-------------------------------------------------"
echo " checking to make sure you are bboted in UEFI"
echo "-------------------------------------------------"
boot_mode=$(sed -n '1p' /sys/firmware/efi/fw_platform_size)

if [ $boot_mode = 64 ]; then
  echo "This system is booted in UEFI with 64-bit x64"
else
  echo "This system is not booted in UEFI with 64-bit x64. Please boot into UEFI mode".
fi

# Check Internet connection
echo "-------------------------------------------------"
echo "Checking intenet connection"
echo "-------------------------------------------------"
if ping -c 3 archlinux.org &>/dev/null; then
  echo "Internet is connected"
else
  echo "internet is not connected. Please connect to the internet before installing."
fi

# Setting System Clock
echo "-------------------------------------------------"
echo "Synchronizing System Clock"
echo "-------------------------------------------------"
timedatectl

# Get user input
echo "--------------------------------------------------"
echo "please answer the following prompts"
echo "---------------------------------------------------"

echo -e "\nEnter username to be created:\n"

read usr_name

echo -e "\nEnter new password for $user:\n"

read usr_password

echo -e "\nEnter new password for root:\n"

read rt_passowrd

echo -e "\nEnter new hostname (device name):\n"

read host

echo -e "\nEnter desired timezone in format of Country/Region (the list of all timezones can be found by first switching to different virtual console using Alt+arrow shorcut and issuing command \"ls /usr/share/zoneinfo/*/* | less\"):\n"

read time_zone

# save these inputs in a file from which the respective fields will be sourced later
echo -e "$usr_name $usr_password $rt_password $host $time_zone" >./confidentials

echo -e "\n\n"

echo "-------------------------------------------------"
echo "Displaying disk and block device information"
echo "-------------------------------------------------"

lsblk -f

echo "-------------------------------------------------"
echo "Please choose what disk and block devices you want to use for this install based on above info."
echo "-------------------------------------------------"

echo -e "\nWhat disk would you like to use for this installation? (ie /dev/sda)\n"

echo -e "\nWhat partition would you like to use for the boot partion? (ie /dev/sda1).\n"

read boot_partiton

echo -e "\nWhat partition would you like to use for the root partiton? (ie /dev/sda2).\n"

read rt_partition

echo "$boot_partiton will be used to for boot partition"
echo "$rt_partition will used for root partition"

# echo "------------------------------------------------"
# echo "Formatting Partitions"
# echo "------------------------------------------------"
