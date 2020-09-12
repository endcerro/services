#! /bin/sh
USER = enzo
PASS = enzo

ssh-keygen -A
adduser -D enzo
echo "enzo:enzo" | chpasswd
/usr/sbin/sshd

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysqld --user=root &

sleep 5

mysql -u root -ptoor < /user.sql

pkill mysqld
mysqld --user=root

