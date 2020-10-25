#! /bin/sh
ssh-keygen -A
adduser -D username
echo "username:password" | chpasswd
/usr/sbin/sshd
nginx -g "daemon off;"