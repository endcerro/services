#! /bin/sh

ssh-keygen -A
adduser -D enzo
echo "enzo:enzo" | chpasswd
/usr/sbin/sshd
#openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
nginx -g "daemon off;"

#openssl genrsa -out key_name.key 2048 


#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt

#bash