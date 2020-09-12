FROM alpine
RUN apk update
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl

RUN apk add bash
RUN apk add vim
RUN apk add curl


COPY ./init.sh .
COPY ./nginx.conf /etc/nginx/.
COPY ./nginx.crt /etc/nginx/.
COPY ./nginx.key /etc/nginx/.
RUN chmod 777 ./init.sh 


RUN mkdir -p /run/nginx
RUN echo "Hello world" > /var/www/index.html
# RUN chown -R www-data:www-data /var/log/nginx;
RUN chmod -R 777 /var/log/nginx

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["./init.sh"]