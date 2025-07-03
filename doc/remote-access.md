# Enhanced MacBook Pro Remote Terminal Access Setup with Zellij

## Overview

This updated plan swaps tmux for Zellij, which offers modern features like WebAssembly plugins, better mouse support, floating panes, and a more intuitive interface. The setup prioritizes local network access first, with WireGuard added last, focusing on simplicity and security with SSH certificates.

## Phase 1: SSH Server Setup with Certificate Authentication

### 1.1 Enable SSH and Basic Hardening

```bash
# Enable SSH
sudo systemsetup -setremotelogin on

# Create custom SSH config directory
sudo mkdir -p /etc/ssh/sshd_config.d/

# Install mosh for better mobile connections
brew install mosh
# For Linux: sudo apt install mosh || sudo yum install mosh
```

### 1.2 SSH Certificate Authority Setup

```bash
# Create CA directory
mkdir -p ~/.ssh/ca
cd ~/.ssh/ca

# Generate CA key pair
ssh-keygen -t ed25519 -f ssh_ca -C "SSH CA for MacBook Pro"

# Generate host certificate
sudo ssh-keygen -s ssh_ca -I "macbook-host" -h -n macbook.local,localhost,$(hostname) /etc/ssh/ssh_host_ed25519_key.pub

# Move host certificate
sudo mv /etc/ssh/ssh_host_ed25519_key-cert.pub /etc/ssh/

# Generate user certificate (valid for 1 year)
ssh-keygen -s ssh_ca -I "$(whoami)-macbook" -n $(whoami) -V +52w ~/.ssh/id_ed25519.pub
```

### 1.3 Enhanced SSH Configuration

Create `/etc/ssh/sshd_config.d/99-custom.conf`:

```bash
# Security hardening
Port 2222
Protocol 2
HostKey /etc/ssh/ssh_host_ed25519_key
HostCertificate /etc/ssh/ssh_host_ed25519_key-cert.pub

# Certificate authentication
TrustedUserCAKeys /etc/ssh/trusted_user_ca_keys
PubkeyAuthentication yes
PasswordAuthentication no
ChallengeResponseAuthentication no

# User restrictions
PermitRootLogin no
AllowUsers $(whoami)
MaxAuthTries 3
MaxSessions 10

# Keep connections alive
ClientAliveInterval 300
ClientAliveCountMax 2
TCPKeepAlive yes

# Performance tuning
UseDNS no
Compression yes

# Disable unnecessary features
X11Forwarding no
AllowAgentForwarding yes
AllowTcpForwarding yes
PermitTunnel no
GatewayPorts no

# Logging
LogLevel VERBOSE

# Rate limiting
MaxStartups 3:30:10
PerSourceMaxStartups 2
PerSourceNetBlockSize 32
```

### 1.4 Install the CA public key

```bash
# Copy CA public key to trusted keys
sudo cp ~/.ssh/ca/ssh_ca.pub /etc/ssh/trusted_user_ca_keys
sudo chmod 644 /etc/ssh/trusted_user_ca_keys

# Restart SSH
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
sudo launchctl load /System/Library/LaunchDaemons/ssh.plist
```

## Phase 2: Zellij Setup with Advanced Features => tmux replacement

### 2.1 Install Zellij and Dependencies

```bash
# Install Zellij
brew install zellij

# Install useful tools
brew install fzf ripgrep bat eza starship atuin
# TODO: setup atuin
```

### 2.2 Zellij Files

#### Config files

- [`zellij` config](../.config/zellij/config.kdl)
- [`zellij` layouts](../.config/zellij/layouts)
- [`zellij` plugins](../.local/share/zellij/plugins) # TODO: where to place plugins

#### Binaries

- [`zellij_docker`](../.local/bin/zellij_docker) => Docker integration
- [`zellij_kubernetes`](../.local/bin/zellij_kubernetes) => Kubernetes integration
- [`zellij_resurrect`](../.local/bin/zellij_resurrect) => Session resurrection script
- [`zellij_work`](../.local/bin/zellij_work) => Smart Zellij session manager

#### Commands

TODO: create alias

```bash
# Main session
zellij attach main || zellij --session main

# Development layout
zellij attach dev || zellij --session dev --layout ~/.config/zellij/layouts/development.kdl

# Monitor Zellij sessions and system resources
zellij --session monitor --layout ~/.config/zellij/layouts/monitor.kdl

# Docker containers
~/.local/bin/zellij_docker -l

# Kubernetes pods
~/.local/bin/zellij_kubernetes -A

# List all Zellij sessions
zellij list-sessions

# Kill zombie sessions
zellij kill-all-sessions

# Create floating pane
zellij action new-pane --floating

# Toggle fullscreen
zellij action toggle-fullscreen
```

### 2.3 Install Zellij Plugins

````bash
# Download room plugin for better session management
wget -O ~/.local/share/zellij/plugins/room.wasm \
  https://github.com/rvcas/room/releases/latest/download/room.wasm

# Download harpoon plugin for quick navigation
wget -O ~/.local/share/zellij/plugins/harpoon.wasm \
  https://github.com/Nacho114/harpoon/releases/latest/download/harpoon.wasm

### 2.4 VSCode Terminal Integration for Zellij

Add to VSCode `settings.json`:

```json
{
  "terminal.integrated.profiles.osx": {
    "zellij": {
      "path": "zellij",
      "args": ["--session", "vscode"]
    },
    "zellij-dev": {
      "path": "zellij",
      "args": [
        "--session",
        "vscode",
        "--layout",
        "~/.config/zellij/layouts/development.kdl"
      ]
    }
  },
  "terminal.integrated.env.osx": {
    "TERM": "xterm-256color",
    "COLORTERM": "truecolor"
  }
}
```



## Phase 3: Terminal Applications Setup

### 3.1 Ghostty Configuration

- [`ghostty` config](../.config/ghostty/config)

### 3.2 Terminal.app Profile (if Ghostty unavailable)

```bash
# Export Terminal.app profile after configuration
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# Configure Terminal for Zellij
defaults write com.apple.Terminal ShellExitAction -int 0
defaults write com.apple.Terminal FontAntialias -bool true
defaults write com.apple.Terminal ShowLineMarks -bool false
````

## Phase 4: Container & Kubernetes Integration with Zellij

## Phase 5: Security Enhancements

### 5.1 Install Security Tools

```bash
# Install sshguard for brute-force protection
brew install sshguard

# Configure sshguard
sudo tee /usr/local/etc/sshguard.conf << 'EOF'
BACKEND="/usr/local/libexec/sshguard/sshg-fw-pf"
LOGREADER="STDIN < /var/log/system.log"
THRESHOLD=30
BLOCK_TIME=600
DETECTION_TIME=1800
WHITELIST_FILE=/usr/local/etc/sshguard.whitelist
EOF

# Create whitelist
echo "127.0.0.0/8" | sudo tee /usr/local/etc/sshguard.whitelist
echo "10.0.0.0/8" | sudo tee -a /usr/local/etc/sshguard.whitelist
echo "192.168.0.0/16" | sudo tee -a /usr/local/etc/sshguard.whitelist

# Start sshguard
sudo brew services start sshguard
```

### 5.2 SOPS (Secrets OPerationS) for Encrypted Configuration

```bash
# Install SOPS and age
brew install sops age

# Generate age key for SOPS
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt

# Export age key for SOPS
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
echo 'export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"' >> ~/.zshrc

# Create SOPS config file
cat > ~/.sops.yaml << 'EOF'
creation_rules:
  - path_regex: \.enc\.yaml$
    age: >-
      AGE_PUBLIC_KEY_HERE
  - path_regex: \.enc\.json$
    age: >-
      AGE_PUBLIC_KEY_HERE
  - path_regex: \.enc\.env$
    age: >-
      AGE_PUBLIC_KEY_HERE
  - path_regex: \.enc\.kdl$
    age: >-
      AGE_PUBLIC_KEY_HERE
EOF

# Get your age public key and update .sops.yaml
AGE_PUBLIC_KEY=$(grep -oP 'public key: \K.*' ~/.config/sops/age/keys.txt)
sed -i.bak "s/AGE_PUBLIC_KEY_HERE/$AGE_PUBLIC_KEY/g" ~/.sops.yaml

# Create helper script for secure configs with SOPS
cat > ~/bin/secure-config << 'EOF'
#!/bin/bash
# Manage encrypted configuration files with SOPS

SOPS_AGE_KEY_FILE="${SOPS_AGE_KEY_FILE:-$HOME/.config/sops/age/keys.txt}"
CONFIG_DIR="${HOME}/.config/secure"
mkdir -p "$CONFIG_DIR"

case "$1" in
    encrypt)
        if [[ "$2" == *.yaml ]] || [[ "$2" == *.yml ]]; then
            sops -e "$2" > "$CONFIG_DIR/$(basename "$2" .yaml).enc.yaml"
        elif [[ "$2" == *.json ]]; then
            sops -e "$2" > "$CONFIG_DIR/$(basename "$2" .json).enc.json"
        elif [[ "$2" == *.kdl ]]; then
            sops -e "$2" > "$CONFIG_DIR/$(basename "$2" .kdl).enc.kdl"
        else
            sops -e "$2" > "$CONFIG_DIR/$(basename "$2").enc"
        fi
        echo "Encrypted to $CONFIG_DIR/"
        ;;
    decrypt)
        sops -d "$CONFIG_DIR/$2"
        ;;
    edit)
        sops "$CONFIG_DIR/$2"
        ;;
    view)
        sops -d "$CONFIG_DIR/$2" | less
        ;;
    list)
        ls -la "$CONFIG_DIR"/*.enc* 2>/dev/null || echo "No encrypted files found"
        ;;
    *)
        echo "Usage: $0 {encrypt|decrypt|edit|view|list} <file>"
        echo "Examples:"
        echo "  $0 encrypt config.yaml    # Creates config.enc.yaml"
        echo "  $0 edit config.enc.yaml   # Edit encrypted file"
        echo "  $0 decrypt config.enc.yaml # Decrypt to stdout"
        ;;
esac
EOF
chmod +x ~/bin/secure-config

# Encrypt Zellij layouts with sensitive information
~/bin/secure-config encrypt ~/.config/zellij/layouts/development.kdl

# Create SOPS-encrypted SSH certificate storage
cat > ~/ssh-certs.yaml << EOF
certificates:
  ca_private_key: |
    $(cat ~/.ssh/ca/ssh_ca | sed 's/^/    /')
  user_cert: |
    $(cat ~/.ssh/id_ed25519-cert.pub | sed 's/^/    /')
EOF

~/bin/secure-config encrypt ~/ssh-certs.yaml
rm ~/ssh-certs.yaml
```

### 5.3 Advanced Rate Limiting with pf (macOS)

```bash
# Create pf rules for SSH rate limiting
sudo tee /etc/pf.anchors/ssh-rate-limit << 'EOF'
# SSH rate limiting rules
# Block hosts that make more than 5 connections in 30 seconds
table <ssh_bruteforce> persist
block in quick from <ssh_bruteforce>
pass in on en0 proto tcp to any port 2222 flags S/SA keep state \
  (max-src-conn 5, max-src-conn-rate 5/30, \
   overload <ssh_bruteforce> flush global)
EOF

# Add to main pf.conf
sudo bash -c 'echo "anchor \"ssh-rate-limit\"" >> /etc/pf.conf'
sudo bash -c 'echo "load anchor \"ssh-rate-limit\" from \"/etc/pf.anchors/ssh-rate-limit\"" >> /etc/pf.conf'

# Enable pf
sudo pfctl -e -f /etc/pf.conf
```

### 5.4 Mosh Firewall Configuration

```bash
# Allow mosh UDP ports (60000-61000)
sudo tee -a /etc/pf.anchors/ssh-rate-limit << 'EOF'
# Mosh UDP ports
pass in on en0 proto udp to any port 60000:61000 keep state
EOF

# Reload pf
sudo pfctl -f /etc/pf.conf
```

### 5.5 Persistent Services Setup

#### macOS (launchd)

Create SSH keepalive service:

```bash
sudo tee /Library/LaunchDaemons/com.local.ssh-keepalive.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.ssh-keepalive</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/sbin/sshd</string>
        <string>-D</string>
        <string>-f</string>
        <string>/etc/ssh/sshd_config</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>/var/log/sshd.err</string>
    <key>StandardOutPath</key>
    <string>/var/log/sshd.out</string>
</dict>
</plist>
EOF

# Create Zellij session restore service
tee ~/Library/LaunchAgents/com.user.zellij-restore.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.zellij-restore</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/zellij</string>
        <string>--session</string>
        <string>main</string>
        <string>--layout</string>
        <string>/Users/$(whoami)/.config/zellij/layouts/simple.kdl</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin</string>
    </dict>
</dict>
</plist>
EOF

# Load services
sudo launchctl load /Library/LaunchDaemons/com.local.ssh-keepalive.plist
launchctl load ~/Library/LaunchAgents/com.user.zellij-restore.plist
```

#### Linux (systemd)

Create systemd services:

```bash
# SSH service override (for custom port)
sudo mkdir -p /etc/systemd/system/sshd.service.d/
sudo tee /etc/systemd/system/sshd.service.d/override.conf << 'EOF'
[Service]
ExecStart=
ExecStart=/usr/sbin/sshd -D -f /etc/ssh/sshd_config
Restart=always
RestartSec=5s
EOF

# Zellij session service
sudo tee /etc/systemd/system/zellij-main.service << 'EOF'
[Unit]
Description=Zellij main session
After=network.target

[Service]
Type=forking
User=%i
ExecStart=/usr/bin/zellij --session main --layout /home/%i/.config/zellij/layouts/simple.kdl
ExecStop=/usr/bin/zellij kill-session main
RemainAfterExit=yes
Restart=on-failure
RestartSec=5s
Environment="PATH=/usr/local/bin:/usr/bin:/bin"

[Install]
WantedBy=multi-user.target
EOF

# Enable services
sudo systemctl daemon-reload
sudo systemctl enable --now sshd
sudo systemctl enable --now zellij-main@$USER.service
```

## Phase 6: iPhone Client Configuration

### 6.1 Termius Setup with Certificate Auth & Mosh

1. Install Termius from App Store
2. Import your SSH certificate and CA certificate
3. Create host entry:
   - Host: MacBook's IP
   - Port: 2222
   - Username: Your username
   - Authentication: Certificate
   - Enable Mosh: Toggle ON
   - Post-Login Command: `zellij attach main || zellij --session main`
4. Create Termius Snippets for Zellij - see section 2.2 Zellij File Commands

### 6.3 Blink Shell Configuration with Mosh

```javascript
// Blink config for certificate auth with mosh and Zellij
host "macbook" {
  hostname = "192.168.1.X"
  port = 2222
  user = "yourusername"
  identityFile = "~/.ssh/id_ed25519-cert.pub"
  moshServer = "/usr/local/bin/mosh-server"
  moshPort = "60000:61000"
  proxyCommand = "none"
  strictHostKeyChecking = "no"
  // Auto-attach to Zellij
  remoteCommand = "zellij attach main || zellij --session main"
}

// Quick access to different sessions
host "macbook-dev" {
  hostname = "192.168.1.X"
  port = 2222
  user = "yourusername"
  identityFile = "~/.ssh/id_ed25519-cert.pub"
  moshServer = "/usr/local/bin/mosh-server"
  remoteCommand = "zellij attach dev || zellij --session dev --layout ~/.config/zellij/layouts/development.kdl"
}
```

## Phase 7: Testing & Monitoring

### 7.1 Connection Test Script

- [`.local/bin/remote_access_test`](../.local/bin/remote_access_test)

## Phase 8: WireGuard Setup (Final Phase)

### 8.1 WireGuard Installation and Configuration

```bash
# Install WireGuard
brew install wireguard-tools

# Create config directory
sudo mkdir -p /usr/local/etc/wireguard
cd /usr/local/etc/wireguard

# Generate keys
sudo bash -c 'umask 077; wg genkey | tee server_private.key | wg pubkey > server_public.key'
sudo bash -c 'umask 077; wg genkey | tee iphone_private.key | wg pubkey > iphone_public.key'
```

### 8.2 WireGuard Server Config

```bash
sudo tee /usr/local/etc/wireguard/wg0.conf << EOF
[Interface]
PrivateKey = $(sudo cat server_private.key)
Address = 10.10.10.1/24
ListenPort = 51820
PostUp = sysctl -w net.inet.ip.forwarding=1
PostUp = echo 'nat on en0 from 10.10.10.0/24 to any -> (en0)' | sudo pfctl -f -
PostDown = sudo pfctl -F all

[Peer]
# iPhone
PublicKey = $(sudo cat iphone_public.key)
AllowedIPs = 10.10.10.2/32
PersistentKeepalive = 25
EOF
```

### 8.3 iPhone WireGuard Config

Generate QR code for easy import:

```bash
# Create iPhone config
cat << EOF > iphone.conf
[Interface]
PrivateKey = $(sudo cat iphone_private.key)
Address = 10.10.10.2/24
DNS = 1.1.1.1, 8.8.8.8

[Peer]
PublicKey = $(sudo cat server_public.key)
Endpoint = YOUR_PUBLIC_IP:51820
AllowedIPs = 10.10.10.1/32, 192.168.1.0/24
PersistentKeepalive = 25
EOF

# Generate QR code
brew install qrencode
qrencode -t ansiutf8 < iphone.conf

# Encrypt the config
~/bin/secure-config encrypt iphone.conf
rm iphone.conf
```

### 8.4 Start WireGuard

```bash
# Load WireGuard
sudo wg-quick up wg0

# Enable on boot
sudo brew services start wireguard-tools
```

### 4. Backup Strategy with SOPS

```bash
# Backup Zellij configs
cat > ~/bin/backup-zellij-config << 'EOF'
#!/bin/bash
BACKUP_DIR="$HOME/.config/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="zellij-config-$TIMESTAMP"

mkdir -p "$BACKUP_DIR"

# Create backup structure
TEMP_DIR=$(mktemp -d)
mkdir -p "$TEMP_DIR/$BACKUP_NAME"

# Copy configs
cp -r ~/.config/zellij "$TEMP_DIR/$BACKUP_NAME/"
cp -r ~/.ssh/ca "$TEMP_DIR/$BACKUP_NAME/"
cp ~/.sops.yaml "$TEMP_DIR/$BACKUP_NAME/"
cp -r ~/.config/ghostty "$TEMP_DIR/$BACKUP_NAME/"

# Get list of active sessions
zellij list-sessions > "$TEMP_DIR/$BACKUP_NAME/active-sessions.txt" 2>/dev/null

# Create manifest
cat > "$TEMP_DIR/$BACKUP_NAME/manifest.yaml" << MANIFEST
backup:
  timestamp: "$TIMESTAMP"
  hostname: "$(hostname)"
  user: "$(whoami)"
  zellij_version: "$(zellij --version)"
  files:
    - zellij_config
    - ssh_ca
    - sops.yaml
    - ghostty_config
    - active_sessions
MANIFEST

# Tar and encrypt
cd "$TEMP_DIR"
tar czf "$BACKUP_NAME.tar.gz" "$BACKUP_NAME"
sops -e --input-type binary --output-type binary \
    "$BACKUP_NAME.tar.gz" > "$BACKUP_DIR/$BACKUP_NAME.tar.gz.enc"

# Clean up
rm -rf "$TEMP_DIR"

echo "Backup saved to $BACKUP_DIR/$BACKUP_NAME.tar.gz.enc"
EOF
chmod +x ~/bin/backup-zellij-config
```

## Key Advantages of Zellij over Tmux

1. **Better Defaults**: No need for extensive configuration to get started
2. **Floating Panes**: Native support for floating windows
3. **WebAssembly Plugins**: Extensible with WASM plugins
4. **Better Mouse Support**: Works out of the box
5. **Session Serialization**: Built-in session saving/restoration
6. **Modern UI**: Cleaner, more intuitive interface
7. **Built-in Layouts**: Powerful layout system with KDL
8. **Better Copy Mode**: More intuitive selection and copying
9. **Plugin Ecosystem**: Growing collection of useful plugins
10. **Performance**: Generally faster and more responsive

## Final Notes

- Zellij's configuration is more straightforward than tmux
- The layout system is more powerful and easier to understand
- Plugin support adds significant extensibility
- Session persistence works better out of the box
- The keybindings are more intuitive (though we've added tmux compatibility)
- Ghostty + Zellij is a modern, performant combination
