#!/usr/bin/env bash

hostParam=$1

# Allow .htaccess
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
echo "ServerName $hostParam" >> /etc/apache2/apache2.conf

# HTTPS enable
a2enmod rewrite ssl
mkdir /etc/apache2/sites-available/ssl


source /etc/apache2/envvars
tail -F /var/log/apache2/* &

# run apache in back
exec apache2 -D FOREGROUND