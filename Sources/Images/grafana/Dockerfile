FROM alpine
RUN apk update

RUN apk add	vim
RUN apk add	bash

RUN apk add --no-cache grafana --repository=http://nl.alpinelinux.org/alpine/edge/testing

COPY ./init.sh .

RUN chmod 777 ./init.sh 

EXPOSE 3000

CMD ["./init.sh"]

#docker build -t testnginx .
#docker run --rm -ti -p 80:80 -p 443:443 testnginx