FROM php:7.4-apache

# run.sh script drop in docker
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Launch USE OWN HOST NAME FOR FIRST PARAMETER!
CMD ["/run.sh","YOUR_HOST_NAME"]