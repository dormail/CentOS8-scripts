#!/bin/bash
# as a database we use MySQL/MariadDB

# get all the necessary packages
# those are the ones that are either necessary or boost the performance
# if you need to do some fancy stuff maybe some other php packages are needed, read
# https://docs.nextcloud.com/server/20/admin_manual/installation/source_installation.html#prerequisites-for-manual-installation
dnf update -y
dnf install -y \
	epel-release \
	yum-utils \
	unzip \
	curl \
	wget \
	bash-completion \
	policycoreutils-python-utils \
	mlocate \
	bzip2 \
	php \
	php-dom \
	php-gd \
	php-json \
	php-mbstring \
	php-posix \
	php-zip \
	php-pdo_mysql \
	php-intl \
	redis

# for the caching module redis we need to instsall remi repo which we get through the epel repo
# here I used php 7.4
dnf -y update
dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf -y update

dnf -y module reset php
dnf -y module enable php:remi-7.4

dnf install -y php-pecl-redis

# setting up database
dnf install -y mariadb mariadb-server
systemctl enable mariadb.service
systemctl start mariadb.service
mysql_secure_installation



# we will use nginx 
# since we have an extra subdomain we put it in the webroot of this nginx server
# and we will copy the file since I am to lazy to work with bash scripting
