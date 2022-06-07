FROM ubuntu:18.04
LABEL maintainer="podmigor@gmail.com"
LABEL version="0.1"
LABEL description="Apache docker image based on Ubuntu 18.04"
RUN apt-get update && apt-get install apache2 -y \
    && sed -i '0,/Listen [0-9]*/s//Listen 8080/' /etc/apache2/ports.conf \
    && service apache2 start \
    && useradd hillel_devops
EXPOSE 8080/tcp
COPY ./template/ /var/www/html
ENTRYPOINT apache2ctl -D FOREGROUND

