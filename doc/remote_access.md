# MacBook Remote Terminal Access with Automated Setup

## Overview

This documentation describes a modern, script-based approach to setting up secure remote terminal access from iPhone/iPad to your MacBook using SSH certificates, Zellij terminal multiplexer, and enterprise-grade security.

**Key improvements over the original manual setup:**

- 🤖 **Automated scripts** for all configuration steps
- 📱 **Mobile-first design** with QR codes and setup wizards
- 🛡️ **Enhanced security** with certificate authentication and rate limiting
- 🔧 **Comprehensive tooling** for monitoring, troubleshooting, and maintenance
- 📊 **Health checks** and diagnostics for system reliability

## What's New: Script-Based Architecture

The setup has been completely modularized into purpose-built scripts that handle all the manual configuration steps from the original guide:

### Setup Scripts

- `setup_ssh` - Complete SSH certificate authority and server configuration
- `setup_security` - SSHGuard, SOPS encryption, and firewall rules
- `setup_service` - macOS LaunchAgent services for persistence

### Mobile Configuration

- `generate_qr_config` - QR codes for easy iPhone/iPad setup
- `setup_iphone_guide` - Interactive mobile setup wizard

### Monitoring & Maintenance

- `remote_health_check` - Comprehensive system health monitoring
- `connection_test` - Connection testing suite
- `cert_status` - Certificate management and renewal
- `troubleshoot_remote` - Advanced diagnostic and repair tools

## Quick Start Guide

### 1. Deploy Configuration Files

```bash
# From the ~/.file directory
cd ~/.file
stow .
```

This symlinks all configuration files to their proper system locations.

### 2. Run Setup Scripts (in order)

```bash
# 1. Set up SSH certificates and server configuration
~/.local/bin/setup_ssh

# 2. Configure security services (SSHGuard, firewall, SOPS)
~/.local/bin/setup_security

# 3. Install and start system services
~/.local/bin/setup_service install
```

### 3. Generate Mobile Configuration

```bash
# Generate certificates and QR codes for iPhone setup
~/.local/bin/generate_qr_config all

# Run interactive mobile setup guide
~/.local/bin/setup_iphone_guide
```

### 4. Verify Setup

```bash
# Run comprehensive health check
~/.local/bin/remote_health_check

# Test all connections
~/.local/bin/connection_test
```

## Detailed Setup Process

### Phase 1: SSH Certificate Infrastructure

The `setup_ssh` script automates the complete SSH certificate setup:

**What it does:**

- Enables SSH service on port 2222
- Creates Certificate Authority (CA) with ed25519 keys
- Generates host and user certificates (1-year validity)
- Installs SSH hardening configuration
- Sets up certificate-based authentication

**Manual steps required:**

- Run with sudo privileges when prompted
- Confirm SSH service restart

**Generated files:**

- `~/.ssh/ca/ssh_ca` - CA private key (secure)
- `~/.ssh/ca/ssh_ca.pub` - CA public key
- `~/.ssh/id_ed25519-cert.pub` - User certificate
- `/etc/ssh/trusted_user_ca_keys` - System CA trust
- `/etc/ssh/sshd_config.d/99_custom.conf` - SSH hardening

### Phase 2: Security Hardening

The `setup_security` script implements enterprise-grade security:

**What it does:**

- Configures SSHGuard for brute-force protection
- Sets up SOPS for encrypted configuration storage
- Installs pf firewall rules with rate limiting
- Creates secure configuration management tools

**Manual steps required:**

- Firewall rules activation (script will prompt)
- Review generated age encryption key

**Generated services:**

- SSHGuard with automatic IP blocking
- pf firewall with SSH rate limiting (5 conn/30sec)
- SOPS encrypted config management
- Mosh UDP port allowances (60000-61000)

### Phase 3: System Services

The `setup_service` script manages persistent services:

**What it does:**

- Creates LaunchAgent plists for SSH keepalive
- Sets up Zellij session restoration service
- Manages service loading/unloading
- Provides service status monitoring

**Manual steps required:**

- None - fully automated

**Services created:**

- `com.user.ssh_keepalive` - Maintains SSH connectivity
- `com.user.zellij_restore` - Auto-restores Zellij sessions

### Phase 4: Mobile Client Setup

The mobile setup tools provide multiple configuration methods:

**QR Code Generation (`generate_qr_config`):**

- SSH client configuration QR codes
- Termius app-specific configuration
- Blink Shell configuration
- Connection information summary
- Certificate package for secure transfer

**Interactive Setup (`setup_iphone_guide`):**

- Step-by-step mobile configuration
- App-specific instructions (Termius, Blink Shell)
- Security best practices
- Troubleshooting guidance

## Configuration Details

### SSH Configuration

**Port:** 2222 (non-standard for security)  
**Authentication:** Certificate-based only (no passwords)  
**Encryption:** ed25519 keys with 1-year certificate validity  
**Hardening:** Rate limiting, connection limits, verbose logging

### Zellij Integration

**Auto-attach:** SSH sessions automatically launch Zellij  
**Sessions available:**

- `main` - Primary work session
- `dev` - Development environment with container integration
- `monitor` - System monitoring layout

**Layouts:** Pre-configured for different workflows  
**Plugins:** Room and Harpoon for enhanced session management

### Security Features

**Certificate Management:**

- Automatic renewal with `renew_ssh_cert`
- Backup and restoration capabilities
- Expiry monitoring and alerts

**Network Security:**

- SSH rate limiting (5 connections per 30 seconds)
- Automatic IP blocking for failed attempts
- Mosh for resilient mobile connections

**Encrypted Storage:**

- SOPS integration for sensitive configurations
- Age encryption for certificate backups
- Secure configuration management tools

## Monitoring & Maintenance

### Health Monitoring

```bash
# Comprehensive system health check
~/.local/bin/remote_health_check

# Specific component tests
~/.local/bin/connection_test ssh
~/.local/bin/cert_status renewal
~/.local/bin/setup_firewall status
```

### Certificate Management

```bash
# Check certificate expiry
~/.local/bin/cert_status

# Renew certificates (automatic check)
~/.local/bin/renew_ssh_cert check

# Force certificate renewal
~/.local/bin/renew_ssh_cert force
```

### Service Management

```bash
# Check service status
~/.local/bin/setup_service status

# View service logs
~/.local/bin/setup_service logs

# Restart services
~/.local/bin/setup_service restart
```

### Security Monitoring

```bash
# View blocked IPs
~/.local/bin/setup_firewall blocked

# Check failed login attempts
sudo tail -f /var/log/system.log | grep sshd

# Unblock specific IP if needed
~/.local/bin/setup_firewall unblock [IP]
```

## Troubleshooting

### Automated Diagnostics

```bash
# Interactive troubleshooting assistant
~/.local/bin/troubleshoot_remote

# Generate diagnostic report
~/.local/bin/troubleshoot_remote report

# Attempt automatic fixes
~/.local/bin/troubleshoot_remote autofix
```

### Common Issues

**Connection Refused:**

- Check SSH service: `sudo launchctl list | grep ssh`
- Verify port 2222: `lsof -i :2222`
- Test firewall: `~/.local/bin/setup_firewall test`

**Authentication Failed:**

- Check certificates: `~/.local/bin/cert_status`
- Test local connection: `ssh -p 2222 localhost`
- Renew if expired: `~/.local/bin/renew_ssh_cert force`

**Mobile App Issues:**

- Regenerate QR codes: `~/.local/bin/generate_qr_config all`
- Check certificate transfer: `~/.local/bin/generate_qr_config certs`
- Review setup guide: `~/.local/bin/setup_iphone_guide`

## Manual Configuration Required

While most setup is automated, some steps require manual intervention:

### Initial Dependencies

```bash
# Install required packages (if not already installed)
brew install mosh sshguard sops age qrencode
```

### Network Configuration

- **Router settings:** Ensure MacBook has static/reserved IP
- **Firewall exceptions:** Allow SSH (port 2222) and Mosh (UDP 60000-61000) through any router firewall

### Mobile App Installation

- Install SSH client app (Termius, Blink Shell, etc.) from App Store
- Import generated certificates manually via secure transfer method
- For iPhone-specific setup instructions, see [`iphone_setup.md`](iphone_setup.md).

### Certificate Transfer

- Use AirDrop, secure email, or USB for certificate files
- Delete temporary files after successful import
- Verify certificate import in mobile app

## Advanced Features

### Container Integration

The setup includes existing Docker and Kubernetes integration:

```bash
# Docker container sessions
~/.local/bin/session_docker -l

# Kubernetes pod management
~/.local/bin/session_kubernetes -A

# Session resurrection
~/.local/bin/session_resurrect save/restore
```

### Encrypted Configuration

```bash
# Encrypt sensitive files
~/.local/bin/secure_config encrypt myfile.yaml

# Edit encrypted files
~/.local/bin/secure_config edit myfile.enc.yaml

# View encrypted content
~/.local/bin/secure_config view myfile.enc.yaml
```

## Future Enhancements Roadmap

### Phase 8: WireGuard VPN Integration

**Status:** Ready for implementation  
**Purpose:** External network access beyond local WiFi

**Setup tasks:**

- [ ] Install WireGuard: `brew install wireguard-tools`
- [ ] Generate WireGuard keys for server and iPhone
- [ ] Configure WireGuard server on MacBook
- [ ] Create iPhone WireGuard profile with QR code
- [ ] Set up automatic startup and NAT rules
- [ ] Integrate with existing firewall configuration

**Script needed:** `wireguard_setup` (not yet implemented)

### Phase 9: Dynamic DNS Integration

**Status:** Planning phase  
**Purpose:** Access MacBook from anywhere with stable hostname

**Implementation options:**

- **Cloudflare DDNS:** Free tier with API automation
- **DuckDNS:** Simple dynamic DNS service
- **No-IP:** Traditional DDNS provider
- **Custom solution:** Router-based or cron job

**Tasks:**

- [ ] Choose DDNS provider
- [ ] Create automated update script
- [ ] Integrate with network change detection
- [ ] Update mobile app configurations
- [ ] Set up SSL/TLS certificates for custom domain

**Script needed:** `ddns_setup`

### Phase 10: Core DNS Server

**Status:** Advanced planning  
**Purpose:** Local DNS resolution and ad-blocking

**Features:**

- **Local DNS resolution** for .local domains
- **Ad-blocking** with configurable blocklists
- **DNS-over-HTTPS** for enhanced privacy
- **Custom DNS records** for local services
- **Integration** with existing network setup

**Tasks:**

- [ ] Install and configure CoreDNS
- [ ] Set up ad-blocking lists (Pi-hole compatibility)
- [ ] Configure DHCP integration
- [ ] Create management interface
- [ ] Integrate with monitoring tools

**Script needed:** `coredns_setup`

### Phase 11: Advanced Monitoring

**Status:** Enhancement planning  
**Purpose:** Comprehensive system and security monitoring

**Features:**

- **Grafana dashboards** for system metrics
- **Prometheus monitoring** integration
- **Log aggregation** and analysis
- **Security event detection**
- **Mobile notifications** for alerts

**Tasks:**

- [ ] Set up metrics collection
- [ ] Create monitoring dashboards
- [ ] Implement alerting rules
- [ ] Mobile notification integration
- [ ] Automated report generation

### Phase 12: Backup & Disaster Recovery

**Status:** Design phase  
**Purpose:** Automated backup and quick recovery

**Features:**

- **Automated certificate backup** with encryption
- **Configuration versioning** and rollback
- **Remote backup storage** (cloud integration)
- **One-click recovery** procedures
- **Backup verification** and testing

**Tasks:**

- [ ] Design backup strategy
- [ ] Implement automated backup scripts
- [ ] Create recovery procedures
- [ ] Set up backup monitoring
- [ ] Test disaster recovery scenarios

## File Locations Reference

### Configuration Files

- **SSH configs:** `~/.config/ssh/`, `/etc/ssh/sshd_config.d/`
- **Zellij configs:** `~/.config/zellij/`
- **Security configs:** `~/.config/sshguard/`, `~/.config/sops/`
- **Service configs:** `~/Library/LaunchAgents/`

### Scripts & Tools

- **Setup scripts:** `~/.local/bin/setup_ssh`, `setup_security`, `setup_service`
- **Mobile tools:** `~/.local/bin/generate_qr_config`, `setup_iphone_guide`
- **Monitoring:** `~/.local/bin/remote_health_check`, `connection_test`
- **Maintenance:** `~/.local/bin/cert_status`, `renew_ssh_cert`, `setup_firewall`

### Certificates & Keys

- **CA files:** `~/.ssh/ca/`
- **User certificates:** `~/.ssh/id_ed25519*`
- **System trust:** `/etc/ssh/trusted_user_ca_keys`
- **Encrypted backups:** `~/.config/secure/`

### Logs & Monitoring

- **Service logs:** `/tmp/ssh_keepalive.*`, `/tmp/zellij_restore.*`
- **System logs:** `/var/log/system.log` (SSH events)
- **Security logs:** SSHGuard and pf logs
- **Health reports:** Generated by diagnostic tools

## Conclusion

This enhanced setup provides enterprise-grade remote access with mobile-first design, comprehensive automation, and robust security. The script-based approach eliminates manual configuration errors while providing extensive monitoring and troubleshooting capabilities.

**Key benefits:**

- ⚡ **Fast setup:** Complete configuration in ~15 minutes
- 🔒 **Secure by default:** Certificate authentication and rate limiting
- 📱 **Mobile optimized:** QR codes and setup wizards
- 🛠️ **Self-maintaining:** Automated health checks and certificate renewal
- 🔍 **Observable:** Comprehensive monitoring and diagnostics
