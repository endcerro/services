FROM alpine

RUN apk update

#RUN apk add bash tar php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


RUN apk add nginx procps php php-fpm php-mbstring php-mysqli curl bash tar php7-json php7-session vim




RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

RUN chmod -R 777 /var/log/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/.
COPY ./nginx.crt /etc/nginx/.
COPY ./nginx.key /etc/nginx/.


COPY ./www.conf /etc/php7/php-fpm.d/www.conf 

#RUN chmod -R 777 /var/log/php

RUN mkdir /www
COPY ./init.sh .
COPY ./wp-config.php /wp-config.php
COPY wordpress.tar.gz /wordpress.tar.gz

RUN tar -zxvf /wordpress.tar.gz -C /www
RUN chmod 777 ./init.sh 

EXPOSE 5050


CMD ["./init.sh"]