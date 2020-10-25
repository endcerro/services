FROM alpine
RUN apk update
RUN apk add bash
RUN apk add --no-cache telegraf --repository=http://nl.alpinelinux.org/alpine/edge/testing
COPY ./telegraf.conf /etc/telegraf.conf
COPY ./init.sh .
RUN chmod 777 ./init.sh
CMD ["./init.sh"]