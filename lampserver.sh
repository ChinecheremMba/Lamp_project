#!/bin/bash

# Update and upgrade packages, install Apache, and enable necessary modules
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y apache2 
sudo a2enmod expires
sudo a2enmod headers
sudo a2enmod include
sudo a2enmod rewrite
sudo systemctl enable apache2

# Install PHP and related packages
sudo apt-get -y install php
sudo apt-get -y install libapache2-mod-php
sudo apt-get -y install php-common 
sudo apt-get -y install php-all-dev
sudo apt-get -y install php-encrypt 
sudo apt-get -y install php-zip
sudo apt-get -y install php-xml

# Set MySQL root password and install MySQL, php-mysql
sudo debconf-set-selections <<< 'mysql-server/root_password password cheche'
sudo debconf-set-selections <<< 'mysql-server/root_password_again password cheche'
sudo apt-get -y install mysql-server
sudo apt-get -y install php-mysql 

# Restart Apache
sudo service apache2 restart
