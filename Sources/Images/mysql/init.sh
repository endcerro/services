#! /bin/sh
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysqld --user=root &

sleep 5

mysql -u root -ptoor < /user.sql
mysql -u root -ptoor < /mysql.sql

pkill mysqld

mysqld --user=root

