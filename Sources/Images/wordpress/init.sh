#! /bin/sh

#nginx -g "daemon off;"
php -S 0.0.0.0:5050 -t /www/wordpress
#bash

#SSL KEYGEN
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt