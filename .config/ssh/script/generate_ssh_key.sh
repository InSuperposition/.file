#!/bin/bash
# File: generate_key.sh
# Purpose: Generate Ed25519 SSH key for the new user
# Usage: ./generate_key.sh

NEW_USER="${1:-sshuser}"           # Optional: pass username as argument
KEY_FILE="$HOME/.ssh/${NEW_USER}_ed25519"
KEY_COMMENT="$NEW_USER@$(whoami)-mac"

mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ ! -f "$KEY_FILE" ]; then
    ssh-keygen -t ed25519 -a 100 -f "$KEY_FILE" -C "$KEY_COMMENT" -N ""
    echo "✅ SSH key generated at $KEY_FILE"
else
    echo "⚠️ Key $KEY_FILE already exists, skipping generation."
fi