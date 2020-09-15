FROM alpine
RUN apk update
RUN apk add vsftpd
RUN apk add openssl
RUN apk add bash

COPY ./vsftpd.conf /etc/vsftpd.conf

RUN mkdir /etc/certs
COPY ./vsftpd.pem /etc/certs/vsftpd.pem

COPY ./init.sh .
RUN chmod 777 ./init.sh 

#RUN useradd username

#RUN passwd mandar


EXPOSE	21
EXPOSE  21001
EXPOSE  21002
EXPOSE  21003
EXPOSE  21004
EXPOSE  21005
EXPOSE  21006
EXPOSE  21007
EXPOSE  21008
EXPOSE  21009
EXPOSE  21010

CMD ["./init.sh"]
