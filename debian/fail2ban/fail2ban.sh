#!/bin/bash

# Downloads
apt update update -y
apt install fail2ban -y

# copying config file
cp ./jail.local /etc/fail2ban/jail.local

# Activating fail2ban
systemctl start fail2ban
systemctl enable fail2ban
