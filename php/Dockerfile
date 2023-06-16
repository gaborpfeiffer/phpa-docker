FROM php:7.4-apache

# Use own host name
ENV HOST_NAME=rabacsacmstest3

# run.sh script drop in docker
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Launch
CMD ["/run.sh","--hostParam=${HOST_NAME}"]