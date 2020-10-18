#!/bin/bash
# as a database we use MySQL/MariadDB

# get all the necessary packages
# those are the ones that are either necessary or boost the performance
# if you need to do some fancy stuff maybe some other php packages are needed, read
# https://docs.nextcloud.com/server/20/admin_manual/installation/source_installation.html#prerequisites-for-manual-installation
yum update
yum install -y php \
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
# php 7.2 was the version cent os gave me so I went with it - ADJUST TO YOUR NEEDS
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum -y update
yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
yum -y update

yum -y module reset php
yum -y module enable php:remi-7.2

yum install -y php-pecl-redis

# we will use nginx 
# since we have an extra subdomain we put it in the webroot of this nginx server
# and we will copy the file since I am to lazy to work with bash scripting
