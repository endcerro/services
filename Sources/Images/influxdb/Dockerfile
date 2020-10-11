FROM alpine
RUN apk update

RUN apk add influxdb bash

COPY ./init.sh .

COPY ./influxdb.conf /etc/influxdb.conf

RUN chmod 777 ./init.sh 

EXPOSE 8086

CMD ["./init.sh"]

#docker build -t testnginx .
#docker run --rm -ti -p 80:80 -p 443:443 testnginx