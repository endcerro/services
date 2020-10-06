FROM alpine

RUN apk update

RUN apk add bash tar php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /www
COPY ./init.sh .
COPY ./wp-config.php /wp-config.php
COPY wordpress.tar.gz /wordpress.tar.gz

RUN tar -zxvf /wordpress.tar.gz -C /www
RUN chmod 777 ./init.sh 

EXPOSE 5050

CMD ["./init.sh"]