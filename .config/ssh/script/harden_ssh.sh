#!/bin/bash
# File: 05_harden_ssh.sh
# Purpose: Harden SSH server config
# Usage: ./05_harden_ssh.sh

sudo sed -i '' 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i '' 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd

echo "✅ SSH hardened and service restarted"