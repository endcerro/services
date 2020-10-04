#! /bin/sh
ssh-keygen -A
adduser -D username
echo "username:password" | chpasswd
/usr/sbin/sshd

nginx -g "daemon off;"
#bash

#SSL KEYGEN
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt