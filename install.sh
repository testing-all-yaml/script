#!/bin/bash

# Update the system and install Apache
sudo apt update
sudo apt install -y apache2

# Enable Azure AD login
sudo waagent -enable-aad

# Disable root login
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd
