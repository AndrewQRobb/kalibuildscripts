# Kali Linux Build Scripts

Automation scripts for maintaining and configuring Kali Linux VMs in VirtualBox.

## Scripts

- **kali_update.sh** - Full system update (apt update/upgrade/autoremove)
- **install_virtualboxguestadditions.sh** - Install VirtualBox Guest Additions (auto-reboots)
- **reinstall_openvas.sh** - Reset and reinstall OpenVAS vulnerability scanner

## Quick Start

```bash
# Update Kali system
sudo ./kali_update.sh

# Install VirtualBox integration (if in VirtualBox VM)
sudo ./install_virtualboxguestadditions.sh

# Install OpenVAS (optional)
sudo ./reinstall_openvas.sh
```

⚠️ **Warning:** Scripts require root access and some auto-reboot the system

## Documentation

See [CLAUDE.md](CLAUDE.md) for detailed usage instructions, warnings, and fresh VM setup workflow.
