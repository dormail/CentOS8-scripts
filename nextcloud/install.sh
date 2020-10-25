#!/bin/bash
# as a database we use MySQL/MariadDB

# setting up database
systemctl enable mariadb.service
systemctl start mariadb.service
# and type in all the stuff, for more info read 
# https://docs.nextcloud.com/server/20/admin_manual/installation/example_centos.html

# apache webserver
systemctl enable httpd
systemctl start httpd

# redis
systemctl enable redis.service
systemctl start redis.service

# download and copy nc files to the webroot
wget https://download.nextcloud.com/server/releases/nextcloud-20.0.0.zip
unzip nextcloud-20.0.0.zip
cp -r nextcloud/ /var/www/html/
echo 'Copied nextcloud files to /var/www/html/nextcloud'
