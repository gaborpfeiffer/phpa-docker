#!/usr/bin/env bash

# Allow .htaccess
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
echo "ServerName rabacsacmstest3" >> /etc/apache2/apache2.conf

a2enmod rewrite

source /etc/apache2/envvars
tail -F /var/log/apache2/* &

# run apache in back
exec apache2 -D FOREGROUND