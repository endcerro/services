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
COPY ./wordpress-5.5.1.zip .

RUN unzip wordpress-5.5.1.zip -d /www

RUN chmod 777 ./init.sh 

#RUN mkdir -p /run/nginx
#RUN echo "Hello world" > /var/www/index.html
#RUN chmod -R 777 /var/log/nginx

EXPOSE 5050

CMD ["./init.sh"]