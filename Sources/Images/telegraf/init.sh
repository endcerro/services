#! /bin/sh


#adduser -D enzo
#echo "enzo:enzo" | chpasswd

# chmod -R 777 /
mkdir /etc/telegraf
cp /etc/telegraf.conf /etc/telegraf/telegraf.conf
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
#bash

telegraf
#grafana-server -homepath usr/share/grafana