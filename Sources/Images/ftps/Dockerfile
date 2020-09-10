FROM alpine
RUN apk update	
RUN apk add vsftpd
RUN apk add openssl
RUN echo "background=NO" >> /etc/vsftpd/vsftpd.conf

EXPOSE 21

