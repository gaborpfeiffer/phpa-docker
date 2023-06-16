1. git clone https://github.com/gaborpfeiffer/phpa-docker.git
2. cd /phpa-docker
3. /php/Dockerfile change "YOUR_HOST_NAME" to own host name example: rabacsacmstest3
4. Modfiy Windows/System32/drivers/etc/host add your selected host name
5. Run: docker-compose up -d --build
6. Install generated certification /php/ssl
7. Visit https://yourhostname
