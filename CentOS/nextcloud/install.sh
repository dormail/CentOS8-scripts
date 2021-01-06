#!/bin/bash
# as a database we use MySQL/MariadDB

# setting up database
cd nextcloud/ # so nothing gets overwritten
cp -f ./my.cnf /etc/

systemctl enable mariadb.service
systemctl start mariadb.service
# and type in all the stuff, for more info read 
# https://docs.nextcloud.com/server/20/admin_manual/installation/example_centos.html

# redis
systemctl enable redis.service
systemctl start redis.service

# download and copy nc files to the webroot
wget https://download.nextcloud.com/server/releases/nextcloud-20.0.0.zip
unzip nextcloud-20.0.0.zip
echo 'Copying nextcloud files to the webroot (/var/www/html/nextcloud)'
cp -rf nextcloud/ /var/www/html/
echo 'Copied nextcloud files to /var/www/html/nextcloud'

# copy nextcloud.conf to the apache directory
cp nextcloud.conf /etc/httpd/conf.d/

# chowning the webroot
chown -R apache:apache /var/www/html/nextcloud/

# apache webserver
systemctl enable httpd
systemctl start httpd

# back to main directory
cd ..
