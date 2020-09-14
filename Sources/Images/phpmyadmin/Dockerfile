FROM alpine
RUN apk update

RUN apk add openssh
RUN apk add openssl
RUN apk add unzip
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


RUN apk add bash
RUN apk add vim
RUN apk add curl
RUN mkdir /www
#RUN mkdir /var/www/phpmyadmin

COPY ./init.sh .
COPY ./phpMyAdmin-5.0.2-all-languages.zip .

RUN unzip phpMyAdmin-5.0.2-all-languages.zip -d /www

COPY ./config.inc.php /www/phpMyAdmin-5.0.2-all-languages/config.inc.php

RUN chmod 777 ./init.sh 

#RUN mkdir -p /run/nginx
#RUN echo "Hello world" > /var/www/index.html
#RUN chmod -R 777 /var/log/nginx

EXPOSE 5000
EXPOSE 22

CMD ["./init.sh"]