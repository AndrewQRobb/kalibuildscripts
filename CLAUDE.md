# Kali Linux Build Scripts

Automation scripts for maintaining and configuring Kali Linux VMs in VirtualBox.

## Prerequisites

- Kali Linux (VM or bare metal)
- VirtualBox (for guest additions script)
- Root access (all scripts require `sudo`)

## Scripts

### kali_update.sh
System update automation - runs full apt update/upgrade cycle

```bash
sudo ./kali_update.sh
```

**What it does:**
1. `apt update` - refresh package lists
2. `apt dist-upgrade -y` - upgrade distribution packages
3. `apt upgrade` - upgrade remaining packages
4. `apt autoremove -y` - clean up unused packages
5. Check if reboot required

**⚠️ Warning:** User will be prompted for package upgrades

### install_virtualboxguestadditions.sh
Install VirtualBox Guest Additions for better VM integration

```bash
sudo ./install_virtualboxguestadditions.sh
```

**What it does:**
1. Runs system update (same as kali_update.sh)
2. Installs `virtualbox-guest-x11`
3. **Automatically reboots** system

**⚠️ Warning:** System reboots without confirmation - save work first

**When to use:** Fresh Kali VM in VirtualBox (for clipboard, shared folders, better display)

### reinstall_openvas.sh
Reset and reinstall OpenVAS vulnerability scanner

```bash
sudo ./reinstall_openvas.sh
```

**What it does:**
1. Remove existing OpenVAS installation
2. Reinstall OpenVAS from repos
3. Run setup and sync vulnerability data
4. Create admin user with credentials: `admin/admin`
5. Start OpenVAS services

**Access:** https://127.0.0.1:9392

**⚠️ Warning:** Resets admin credentials to `admin/admin` - change these immediately

**When to use:** OpenVAS is broken or needs clean reinstall

## Fresh Kali VM Setup Order

```bash
# 1. Update system
sudo ./kali_update.sh

# 2. Install VirtualBox tools (if in VirtualBox)
sudo ./install_virtualboxguestadditions.sh
# System will reboot

# 3. Install OpenVAS (optional, for vulnerability scanning)
sudo ./reinstall_openvas.sh
```

## Gotchas

- All scripts require root access
- `install_virtualboxguestadditions.sh` reboots automatically
- `reinstall_openvas.sh` takes 10-30 minutes (downloads vulnerability DB)
- OpenVAS default credentials are insecure - change immediately after install
