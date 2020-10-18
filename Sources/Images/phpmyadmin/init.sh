#! /bin/sh

#nginx -g "daemon off;"
#php -S 0.0.0.0:5000 -t /www/phpMyAdmin-5.0.2-all-languages
php-fpm7
#chmod -R 755 /www/
chmod 777 /var/run/php/sock
nginx -g "daemon off;"
#bash

#SSL KEYGEN
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt