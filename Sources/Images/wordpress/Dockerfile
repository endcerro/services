# FROM alpine:latest

# RUN apk update && apk add wget && mkdir /www \
# && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# RUN wget https://wordpress.org/latest.tar.gz \
# && tar -xvf latest.tar.gz \
# && mv wordpress/* /www \
# && rm -rf /var/cache/apk/*

# #COPY ./wp-config.php /www/wp-config.php
# COPY init.sh .

# RUN chmod +x init.sh

# EXPOSE 5050

# CMD ./init.sh
FROM alpine
RUN apk update

RUN apk add bash tar
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /www

COPY ./init.sh .
#COPY ./wordpress-5.5.1.zip .
COPY ./wp-config.php /wp-config.php
COPY wordpress.tar.gz /wordpress.tar.gz
#RUN unzip wordpress-5.5.1.zip -d /www
RUN tar -zxvf /wordpress.tar.gz -C /www
RUN chmod 777 ./init.sh 

EXPOSE 5050

CMD ["./init.sh"]