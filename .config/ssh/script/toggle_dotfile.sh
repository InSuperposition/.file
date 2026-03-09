#!/bin/bash
# File: toggle_dotfile.sh
# Purpose: Apply or revoke dotfile protection for a given SSH user
# Guards: Main user (whoami) cannot modify their own dotfiles
# Usage:
#   ./toggle_dotfile.sh <username> <grant|revoke>

TARGET_USER="${1:-sshuser}"
ACTION="${2:-grant}"  # "grant" or "revoke"
MAIN_USER="$(whoami)"

if [ "$TARGET_USER" == "$MAIN_USER" ]; then
    echo "❌ Cannot modify dotfile protection for the main user ($MAIN_USER). Operation aborted."
    exit 1
fi

if [ "$ACTION" != "grant" ] && [ "$ACTION" != "revoke" ]; then
    echo "Usage: $0 <username> <grant|revoke>"
    exit 1
fi

if [ "$ACTION" == "grant" ]; then
    echo "🔒 Applying dotfile protection for $TARGET_USER..."
    for file in ~/.*; do
        if [ -e "$file" ]; then
            sudo chmod -R +a "$TARGET_USER deny write,delete,append,writeattr,writeextattr,chown" "$file"
        fi
    done
    echo "✅ Dotfile protection granted."
else
    echo "🔓 Revoking dotfile protection for $TARGET_USER..."
    for file in ~/.*; do
        if [ -e "$file" ]; then
            sudo chmod -R -a# 0 "$file" 2>/dev/null
        fi
    done
    echo "✅ Dotfile protection revoked."
fi