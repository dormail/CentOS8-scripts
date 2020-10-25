#!/bin/bash

# Downloads
yum update
yum install epel-release
yum install fail2ban


# Activating fail2ban
systemctl start fail2ban
systemctl enable fail2ban
