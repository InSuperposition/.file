# !/bin/bash

# -------------------------

# Variables to customize

# -------------------------

NEW_USER="sshuser"
MAIN_USER="YOUR_USERNAME"
PUBLIC_KEY="YOUR_PUBLIC_KEY_HERE"  # paste the entire contents of sshuser_ed25519.pub

# -------------------------

# 1. Create the new user

# -------------------------

sudo dscl . -create /Users/$NEW_USER
sudo dscl . -create /Users/$NEW_USER UserShell /bin/zsh
sudo dscl . -create /Users/$NEW_USER RealName "SSH User"
sudo dscl . -create /Users/$NEW_USER UniqueID 5050  # choose a free UID > 500
sudo dscl . -create /Users/$NEW_USER PrimaryGroupID 20  # staff
sudo dscl . -create /Users/$NEW_USER NFSHomeDirectory /Users/$MAIN_USER
sudo dscl . -passwd /Users/$NEW_USER "*"  # disables password login

# -------------------------

# 2. Set up SSH key login

# -------------------------

sudo mkdir -p /Users/$MAIN_USER/.ssh
sudo chmod 700 /Users/$MAIN_USER/.ssh

# Add public key to authorized_keys

echo "$PUBLIC_KEY" | sudo tee -a /Users/$MAIN_USER/.ssh/authorized_keys

# Fix permissions so the SSH user can read the key

sudo chown -R $NEW_USER:staff /Users/$MAIN_USER/.ssh
sudo chmod 600 /Users/$MAIN_USER/.ssh/authorized_keys

# -------------------------

# 3. Optional SSH hardening (ensure password login is disabled)

# -------------------------

sudo sed -i '' 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i '' 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH

sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd

echo "✅ SSH user $NEW_USER created. Use the private key to login."

---

## Toggle sudo

```shell
./toggle_sudo.sh grant

./toggle_sudo.sh revoke
```
