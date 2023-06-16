1. /php/Dockerfile change "YOUR_HOST_NAME" to own host name example: rabacsacmstest3
2. Modfiy Windows/System32/drivers/etc/host add your selected host name
3. Run: docker-compose up -d --build
4. Install generated certification /php/ssl