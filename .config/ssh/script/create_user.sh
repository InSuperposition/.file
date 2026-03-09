#!/bin/bash
# File: create_user.sh
# Purpose: Create new SSH user in main user's home folder, auto-assign UID
# Usage: ./create_user.sh [username]

NEW_USER="${1:-sshuser}"
MAIN_USER="$(whoami)"

# Find free UID above 500
NEXT_UID=$(dscl . -list /Users UniqueID | awk '$2>=501 {print $2}' | sort -n | tail -1)
NEXT_UID=$((NEXT_UID + 1))

sudo dscl . -create /Users/$NEW_USER
sudo dscl . -create /Users/$NEW_USER UserShell /bin/zsh
sudo dscl . -create /Users/$NEW_USER RealName "SSH User"
sudo dscl . -create /Users/$NEW_USER UniqueID $NEXT_UID
sudo dscl . -create /Users/$NEW_USER PrimaryGroupID 20
sudo dscl . -create /Users/$NEW_USER NFSHomeDirectory /Users/$MAIN_USER
sudo dscl . -passwd /Users/$NEW_USER "*"
echo "✅ User $NEW_USER created with UID $NEXT_UID"