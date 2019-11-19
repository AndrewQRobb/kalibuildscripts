!/bin/bash

# Reset OpenVAS Vulnerability Scanner

# This script will remove and reinstall OpenVAS

# Remove OpenVAS from the system
apt autoremove openvas 

# Update and install OpenVAS.
apt update && apt install -y openvas

# Setup, sync and check OpenVAS installation.
openvas-setup && openvas-scapdata-sync && openvas-certdata-sync && openvas-check-setup && openvas-stop 

#Configure admin account for OpenVAS with default login of admin/admin
#Replace username and password as desired.
openvasmd --create-user=admin --role=Admin
openvasmd --user=admin --new-password=admin

#Start OpenVAS services and display portal address.
openvas-start
echo "Log into OpenVAS via your web broswer by going to https://127.0.0.1:9392"
