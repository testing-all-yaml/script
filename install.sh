#!/bin/bash

# Update the system and install Apache
sudo apt update
sudo apt install -y apache2

# Enable Azure AD login
# Install the WALinuxAgent package if not already installed
sudo apt install walinuxagent -y

# Enable Azure AD login
sudo sed -i 's/# Extension to enable AAD login/Extension to enable AAD login\n    EnableSSHKeyBasedAuthentication n/g' /etc/waagent.conf
sudo sed -i 's/# ResourceDisk.Format=ext4/ResourceDisk.Format=ext4/g' /etc/waagent.conf
sudo sed -i 's/# ResourceDisk.Filesystem=ext4/ResourceDisk.Filesystem=ext4/g' /etc/waagent.conf
sudo sed -i 's/# ResourceDisk.MountPoint=\/mnt\/resource/ResourceDisk.MountPoint=\/mnt\/resource/g' /etc/waagent.conf

# Restart the WAagent service
sudo systemctl restart walinuxagent

# Disable root login
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd
