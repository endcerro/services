#! /bin/sh

ssh-keygen -A
adduser -D enzo
echo "enzo:enzo" | chpasswd
/usr/sbin/sshd

#nginx -g "daemon off;"
php -S 0.0.0.0:5000 -t /www/phpMyAdmin-5.0.2-all-languages
#bash

#SSL KEYGEN
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt