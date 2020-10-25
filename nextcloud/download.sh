#!/bin/bash
# Script for downloading all the stuff to set up nextcloud
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
	redis \
	httpd

# for the caching module redis we need to instsall remi repo which we get through the epel repo
# here I used php 7.4
dnf -y update
dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf -y update

dnf -y module reset php
dnf -y module enable php:remi-7.4

# redis
dnf install -y php-pecl-redis

# database: mariadb
dnf install -y mariadb mariadb-server
