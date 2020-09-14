#! /bin/sh


adduser -D enzo
echo "enzo:enzo" | chpasswd

# chmod -R 777 /

#exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21000 /etc/vsftpd/vsftpd.conf

bash