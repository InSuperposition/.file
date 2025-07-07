# iPhone Terminal Access Setup Guide

This guide walks you through setting up secure terminal access from your iPhone to your MacBook using SSH certificates, Zellij, and mobile-optimized configurations.

## Overview

**What you'll achieve:**

- 🔐 Secure SSH access with certificate authentication
- 📱 Mobile-optimized terminal experience with Zellij
- 🔄 Resilient connections with Mosh
- 🛡️ Enterprise-grade security with rate limiting

**Time required:** ~15 minutes

## Prerequisites

Before starting, ensure your MacBook has:

- ✅ SSH service enabled
- ✅ SSH certificates configured
- ✅ Zellij terminal multiplexer installed
- ✅ Security services running (SSHGuard, firewall)

**Quick check:** Run `~/.local/bin/remote_health_check`

## Step 1: Prepare Your MacBook

### 1.1 Initial Setup

Run the automated setup scripts:

```bash
# Set up SSH certificates and configuration
~/.local/bin/setup_ssh

# Configure security services
~/.local/bin/setup_security

# Install system services
~/.local/bin/setup_service install
```

### 1.2 Verify Setup

```bash
# Run comprehensive health check
~/.local/bin/remote_health_check

# Test connections
~/.local/bin/connection_test
```

## Step 2: Generate Mobile Configuration

### 2.1 Create Certificate Package

```bash
# Generate certificates and QR codes for mobile setup
~/.local/bin/generate_qr_config all
```

This creates:

- 📄 Certificate files for transfer
- 📱 QR codes for easy configuration
- 📋 Setup instructions

### 2.2 Interactive Setup Assistant

```bash
# Run the interactive guide
~/.local/bin/setup_iphone_guide
```

## Step 3: Configure Your iPhone

### Option A: Termius (Recommended)

**Install:** Download Termius from the App Store

**Setup steps:**

1. **Import SSH Key:**

   - Tap '+' → SSH Key
   - Import private key (`id_ed25519`)
   - Give it a name like "MacBook Key"

2. **Import Certificate:**

   - In SSH Keys section
   - Import certificate (`id_ed25519-cert.pub`)
   - Associate with your private key

3. **Create Host:**

   - Tap '+' → Host
   - Address: `[Your MacBook IP]`
   - Port: `2222`
   - Username: `[Your username]`
   - Key: Select imported key + certificate

4. **Configure Advanced:**
   - Enable Mosh (if available)
   - Post-login: `zellij attach main || zellij --session main`
   - Terminal: `xterm-256color`

### Option B: Blink Shell

**Install:** Download Blink Shell from the App Store

**Setup steps:**

1. **Import Keys:**

   ```conf
   Settings → Keys
   Import: id_ed25519 (private key)
   Import: id_ed25519-cert.pub (certificate)
   ```

2. **Configure Host:**

   ```conf
   Settings → Hosts → Add:
   hostname = "[Your MacBook IP]"
   port = 2222
   user = "[Your username]"
   identityFile = "id_ed25519"
   certificateFile = "id_ed25519-cert.pub"
   moshServer = "/usr/local/bin/mosh-server"
   moshPort = "60000:61000"
   remoteCommand = "zellij attach main || zellij --session main"
   ```

## Step 4: Connection Details

### Network Information

Your MacBook is accessible at:

- **Primary IP:** `[Run: ifconfig | grep "inet " | grep -v "127.0.0.1"]`
- **SSH Port:** `2222`
- **Username:** `[Your macOS username]`
- **Authentication:** Certificate-based

### Zellij Sessions

Once connected, you can access different sessions:

```bash
# Main session (default)
zellij attach main

# Development environment
zellij attach dev

# System monitoring
zellij attach monitor

# List all sessions
zellij list-sessions
```

## Step 5: Security Best Practices

### Mobile Device Security

- 🔒 Use strong passcode/biometric lock
- ⏰ Enable automatic lock (1-2 minutes)
- 🔐 Don't store SSH keys in insecure apps
- 📱 Use reputable SSH client apps only

### Certificate Security

- 🚫 Never share your private key
- 📤 Use secure transfer methods (AirDrop, encrypted email)
- 🗑️ Delete temporary files after setup
- 🔄 Rotate certificates annually

### Network Security

- 🏠 Prefer trusted WiFi networks
- 🚫 Avoid public WiFi for SSH when possible
- 📡 Mosh provides protection over unreliable networks
- 👁️ Monitor failed login attempts

## Troubleshooting

### Common Issues

**Connection Refused:**

```bash
# Check SSH service
sudo launchctl list | grep ssh

# Verify port is listening
lsof -i :2222

# Check firewall
~/.local/bin/setup_firewall status
```

**Authentication Failed:**

```bash
# Check certificates
~/.local/bin/cert_status

# Test local connection
ssh -p 2222 localhost

# Renew if expired
~/.local/bin/renew_ssh_cert check
```

**Mobile App Issues:**

- Ensure both private key AND certificate are imported
- Check file permissions (apps may be picky)
- Try different authentication methods
- Clear app data and re-import if needed

### Diagnostic Tools

```bash
# Comprehensive health check
~/.local/bin/remote_health_check

# Test all connections
~/.local/bin/connection_test

# Certificate status
~/.local/bin/cert_status

# Advanced troubleshooting
~/.local/bin/troubleshoot_remote
```

## Advanced Features

### Development Workflow

```bash
# Access development session with containers
zellij attach dev

# Docker integration
~/.local/bin/session_docker

# Kubernetes integration
~/.local/bin/session_kubernetes
```

### Session Management

```bash
# Create custom session
zellij --session myproject --layout ~/.config/zellij/layouts/development.kdl

# Save session state
~/.local/bin/session_resurrect save

# Restore session
~/.local/bin/session_resurrect restore
```

### Encrypted Configuration

```bash
# Encrypt sensitive files
~/.local/bin/secure_config encrypt myconfig.yaml

# Decrypt for viewing
~/.local/bin/secure_config view myconfig.enc.yaml
```

## Maintenance

### Regular Tasks

**Weekly:**

```bash
# Health check
~/.local/bin/remote_health_check

# Check for blocked IPs
~/.local/bin/setup_firewall blocked
```

**Monthly:**

```bash
# Certificate status
~/.local/bin/cert_status renewal

# Update packages
brew bundle install
```

**Annually:**

```bash
# Renew certificates
~/.local/bin/renew_ssh_cert force

# Security audit
~/.local/bin/troubleshoot_remote
```

### Monitoring

**Service Status:**

```bash
# Check all services
~/.local/bin/setup_service status

# View service logs
~/.local/bin/setup_service logs
```

**Security Monitoring:**

```bash
# View blocked IPs
sudo pfctl -t ssh_bruteforce -T show

# SSH connection logs
sudo tail -f /var/log/system.log | grep sshd
```

## Support

### Getting Help

If you encounter issues:

1. **Run diagnostics:** `~/.local/bin/troubleshoot_remote`
2. **Check documentation:** `~/.file/doc/remote_access.md`
3. **Interactive guide:** `~/.local/bin/setup_iphone_guide`

### Useful Commands

| Command                            | Purpose                 |
| ---------------------------------- | ----------------------- |
| `~/.local/bin/remote_health_check` | System health overview  |
| `~/.local/bin/connection_test`     | Test connections        |
| `~/.local/bin/cert_status`         | Certificate information |
| `~/.local/bin/renew_ssh_cert`      | Certificate management  |
| `~/.local/bin/setup_firewall`      | Firewall management     |
| `~/.local/bin/generate_qr_config`  | Mobile setup codes      |
| `~/.local/bin/troubleshoot_remote` | Advanced diagnostics    |

### File Locations

- **Certificates:** `~/.ssh/ca/`, `~/.ssh/id_ed25519*`
- **Configuration:** `~/.config/ssh/`, `~/.config/zellij/`
- **Scripts:** `~/.local/bin/`
- **Logs:** `/tmp/ssh_keepalive.*`, `/tmp/zellij_restore.*`
- **Services:** `~/Library/LaunchAgents/`

---

**Enjoy secure mobile terminal access! 🚀**

For the complete setup documentation, see [`doc/remote_access.md`](remote_access.md).
