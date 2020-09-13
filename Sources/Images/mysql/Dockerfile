FROM alpine
RUN apk update

RUN apk add mariadb mariadb-client

RUN apk add	vim
RUN apk add	bash

COPY ./user.sql .
COPY ./init.sh .
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf


RUN mkdir -p /run/mysqld
RUN chmod 777 ./init.sh 

EXPOSE 3306

CMD ["./init.sh"]

#docker build -t testnginx .
#docker run --rm -ti -p 80:80 -p 443:443 testnginx