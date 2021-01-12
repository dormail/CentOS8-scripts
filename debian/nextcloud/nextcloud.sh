#!/bin/bash
# this install uses mariadb as a database
# right now there is no extra caching implemented

apt update -y

# php modules
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
	apache2

# copy apache site config
cp ./nextcloud.conf /etc/apache2/sites-available/nextcloud.conf

