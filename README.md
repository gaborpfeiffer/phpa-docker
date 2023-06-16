1. git clone https://github.com/gaborpfeiffer/phpa-docker.git
2. cd /phpa-docker
3. Open file: /php/Dockerfile and change "YOUR_HOST_NAME" to own host name example: rabacsacmstest3
4. Open file: Windows/System32/drivers/etc/host and modify: add your selected host name
5. Run: docker-compose up -d --build
6. Install generated certification /php/ssl
7. Visit https://yourhostname
