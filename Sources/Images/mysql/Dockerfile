FROM alpine
RUN apk update
RUN apk add nginx
RUN apk add openssh
COPY ./init.sh .
RUN chmod 777 ./init.sh 


RUN mkdir -p /run/nginx
RUN echo "Hello world" > /var/www/index.html

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["./init.sh"]