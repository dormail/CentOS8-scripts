#!/bin/bash

# Downloads
yum -y update
yum -y install epel-release
yum -y install fail2ban


# Activating fail2ban
systemctl start fail2ban
systemctl enable fail2ban
