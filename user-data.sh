#!/bin/bash

apt update -y
apt install apache2 mysql-server php php-mysql libapache2-mod-php wget unzip -y

systemctl start apache2
systemctl enable apache2
systemctl start mysql
systemctl enable mysql

cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip

rm -rf /var/www/html/*
cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

a2enmod rewrite
systemctl restart apache2