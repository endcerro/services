#! /bin/sh
USER = enzo
PASS = enzo

ssh-keygen -A
adduser -D enzo
echo "enzo:enzo" | chpasswd
/usr/sbin/sshd
nginx -g "daemon off;"

