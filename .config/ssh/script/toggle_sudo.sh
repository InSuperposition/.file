#!/bin/bash
# File: toggle_sudo.sh
# Purpose: Grant or revoke sudo privileges for a given SSH user
# Guards: Main user (whoami) can never revoke their own sudo
# Usage:
#   ./toggle_sudo.sh <username> <grant|revoke>

TARGET_USER="${1:-sshuser}"
ACTION="${2:-revoke}"  # "grant" or "revoke"
MAIN_USER="$(whoami)"

if [ "$TARGET_USER" == "$MAIN_USER" ] && [ "$ACTION" == "revoke" ]; then
    echo "❌ Cannot revoke sudo from main user ($MAIN_USER). Operation aborted."
    exit 1
fi

if [ "$ACTION" != "grant" ] && [ "$ACTION" != "revoke" ]; then
    echo "Usage: $0 <username> <grant|revoke>"
    exit 1
fi

if [ "$ACTION" == "grant" ]; then
    sudo dscl . -append /Groups/admin GroupMembership $TARGET_USER
    echo "✅ Sudo privileges granted to $TARGET_USER"
else
    sudo dscl . -delete /Groups/admin GroupMembership $TARGET_USER
    echo "✅ Sudo privileges revoked from $TARGET_USER"
fi

# Optional: display groups
groups $TARGET_USER