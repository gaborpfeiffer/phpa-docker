#!/usr/bin/env bash

param1=$1

# Allow .htaccess
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
echo "ServerName $param1" >> /etc/apache2/apache2.conf

# HTTPS enable
a2enmod rewrite ssl
mkdir /etc/apache2/sites-available/ssl

# Create vhost file
touch /etc/apache2/sites-enabled/custom.conf
echo "LoadModule ssl_module /usr/lib/apache2/modules/mod_ssl.so

<VirtualHost *:80>

    ServerName $param1

    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

<VirtualHost _default_:443>

    DocumentRoot /var/www/html
    ServerName $param1
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on

    SSLCertificateFile '/etc/apache2/sites-available/ssl/$param1.crt'
    SSLCertificateKeyFile '/etc/apache2/sites-available/ssl/$param1.key'

    <FilesMatch '\.(cgi|shtml|phtml|php)$'>
        SSLOptions +StdEnvVars
    </FilesMatch>

    <Directory '/var/www/html'>
        Options Indexes FollowSymLinks Includes execCGI
        AllowOverride All
        Require all granted
    </Directory>

</VirtualHost>" >> /etc/apache2/sites-enabled/custom.conf


source /etc/apache2/envvars
tail -F /var/log/apache2/* &

# run apache in back
exec apache2 -D FOREGROUND