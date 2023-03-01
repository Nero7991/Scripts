#!/bin/bash

# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Prompt user for new username
read -p "Enter username: " username

# Create new user
useradd -m -s /bin/bash $username

# Set password for new user
echo "Please enter a password for the new user: "
passwd $username

# Add user to sudo group
usermod -aG sudo $username

# Add user to sudoers list
echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Display success message
echo "User $username has been created and added to the sudoers list."
