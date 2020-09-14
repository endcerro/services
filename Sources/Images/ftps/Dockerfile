FROM alpine
RUN apk update
RUN apk add vsftpd
RUN apk add openssl
RUN apk add bash

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./vsftpd.pem /.

COPY ./init.sh .
RUN chmod 777 ./init.sh 

#RUN useradd username

#RUN passwd mandar


EXPOSE 21
CMD ["./init.sh"]