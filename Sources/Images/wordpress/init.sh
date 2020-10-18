#! /bin/sh

#nginx -g "daemon off;"
#tar -zxvf /wordpress.tar.gz -C /www/
#chmod 777 -R /www
#chmod 777 -R /www/wordpress
rm /www/wordpress/wp-config.php
cp /wp-config.php /www/wordpress/wp-config.php

#php -S 0.0.0.0:5050 -t /www/wordpress
php-fpm7
chmod 777 /var/run/php/sock
nginx -g "daemon off;"
#bash

#SSL KEYGEN
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt