FROM alpine
RUN apk update

RUN apk add openssh
RUN apk add mysql mysql-client

RUN apk add	vim
RUN apk add	bash

COPY ./user.sql .
COPY ./init.sh .

RUN mkdir -p /run/mysqld
RUN chmod 777 ./init.sh 

EXPOSE 667

CMD ["./init.sh"]


#docker build -t testnginx .
#docker run --rm -ti -p 80:80 -p 443:443 testnginx