FROM php:7.4-apache

# run.sh script drop in docker
ADD run.sh /run.sh
RUN chmod 755 /*.sh

RUN a2enmod rewrite ssl
RUN mkdir /etc/apache2/sites-available/ssl

# launch
CMD ["/run.sh"]