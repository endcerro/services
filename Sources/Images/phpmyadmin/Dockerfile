FROM alpine
RUN apk update


RUN apk add unzip
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add bash
RUN mkdir /www

COPY ./init.sh .
COPY ./phpMyAdmin-5.0.2-all-languages.zip .

RUN unzip phpMyAdmin-5.0.2-all-languages.zip -d /www

COPY ./config.inc.php /www/phpMyAdmin-5.0.2-all-languages/config.inc.php

RUN chmod 777 ./init.sh 


EXPOSE 5000

CMD ["./init.sh"]