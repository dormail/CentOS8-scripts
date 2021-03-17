#!/bin/bash
# classical lamp stack

apt update -y

# packages
apt install -y \
	php-ctype \
	php-curl \
	php-dom \
	php-gd \
	php-iconv \
	php-json \
	php-xml \
	php-mbstring \
	openssl \
	php-posix \
	php-simplexml \
	php-xmlreader \
	php-xmlwriter \
	php-zip \
	php-mysql \
	php-fileinfo \
	php-bz2 \
	php-intl \
	php-ldap \
	php-smbclient \
	php-ftp \
	php-imap \
	php-bcmath \
	php-gmp \
	php-imagick \
	ffmpeg \
	libreoffice \
	apache2 \
	mariadb-server

# copy apache site config
cp ./nextcloud.conf /etc/apache2/sites-available/nextcloud.conf

# apache config
a2enmod rewrite
a2enmod env
a2enmod dir
a2enmod mime

systemctl restart apache2

# mariadb
systemctl enable mariadb.service
systemctl start mariadb.service
# now admin needs to add a database

# nextcloud download and initial setup
rm -rf nextcloud-20.0.4.zip nextcloud
wget https://download.nextcloud.com/server/releases/nextcloud-20.0.4.zip
unzip nextcloud-20.0.4.zip
cp -r nextcloud /var/www/html/
mkdir -p /var/www/html/nextcloud/data
chown -R www-data:www-data /var/www/html/nextcloud
systemctl restart apache2
