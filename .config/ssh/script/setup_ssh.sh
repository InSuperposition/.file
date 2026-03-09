#!/bin/bash
# File: setup_ssh.sh
# Purpose: Install SSH public key and permissions
# Usage: ./setup_ssh.sh [username]

NEW_USER="${1:-sshuser}"
MAIN_USER="$(whoami)"
KEY_FILE="$HOME/.ssh/${NEW_USER}_ed25519"
PUBLIC_KEY=$(cat "${KEY_FILE}.pub")

sudo mkdir -p /Users/$MAIN_USER/.ssh
sudo chmod 700 /Users/$MAIN_USER/.ssh

echo "$PUBLIC_KEY" | sudo tee -a /Users/$MAIN_USER/.ssh/authorized_keys > /dev/null
sudo chown -R $NEW_USER:staff /Users/$MAIN_USER/.ssh
sudo chmod 600 /Users/$MAIN_USER/.ssh/authorized_keys

echo "✅ SSH key installed for $NEW_USER"