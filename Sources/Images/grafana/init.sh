#! /bin/sh


#adduser -D enzo
#echo "enzo:enzo" | chpasswd

# chmod -R 777 /
#bash
#grafana-server -homepath usr/share/grafana &
#pkill grafana-server
#rm -rf /usr/share/grafana/conf
#rm /usr/share/grafana/data/grafana.db
#cp /grafana.db /usr/share/grafana/data/grafana.db
#chmod 777 /usr/share/grafana/data/grafana.db
#cd /usr/share/grafana/data
#chown grafana:grafana ./grafana.db
rm -rf /usr/share/grafana
tar -zxvf /grafana.tar.gz -C /usr/share/
grafana-server -homepath usr/share/grafana