FROM alpine
RUN apk update


RUN apk add unzip
#RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add nginx procps php php-fpm php-mbstring php-mysqli curl bash tar php7-json php7-session vim


RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

RUN apk add bash
RUN mkdir /www


COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/.
COPY ./nginx.crt /etc/nginx/.
COPY ./nginx.key /etc/nginx/.

COPY ./www.conf /etc/php7/php-fpm.d/www.conf 




COPY ./init.sh .
COPY ./phpMyAdmin-5.0.2-all-languages.zip .

RUN unzip phpMyAdmin-5.0.2-all-languages.zip -d /www

COPY ./config.inc.php /www/phpMyAdmin-5.0.2-all-languages/config.inc.php

RUN chmod 777 ./init.sh 


EXPOSE 5000

CMD ["./init.sh"]