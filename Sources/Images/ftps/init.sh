#! /bin/sh


#adduser -D enzo
#echo "enzo:enzo" | chpasswd

# chmod -R 777 /
USER=username
PASSWORD=password


#exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21000 /etc/vsftpd/vsftpd.conf

adduser -D $USER
echo "$USER:$PASSWORD" | chpasswd
mkdir /home/$USER/ftp
chown $USER:$USER /home/$USER/ftp
chmod a-w /home/$USER/ftp

mkdir /home/$USER/ftp/test
chown $USER:$USER /home/$USER/ftp/test

echo $USER > /etc/vsftpduserlist.conf

mkdir /var/run/vsftpd
mkdir /var/run/vsftpd/empty




#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/certs/vsftpd.pem -out /etc/certs/vsftpd.pem

#NEED TO CREATE SOME FOLDER AND WE ARE GOOD TO GO
#vsftpd
#vsftpd -opasv_min_port=21000 -opasv_max_port=21000
#bash

#bash
/usr/sbin/vsftpd /etc/vsftpd.conf