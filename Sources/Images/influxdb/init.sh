#!/usr/bin/env bash
bash
if [[ $(ls /var/lib | grep lock) ]]; 
then
	echo "found the lock, not creating" >> /scriptlog
	influxd -config /etc/influxdb.conf run
fi
	echo "lock not found, creating" >> /scriptlog
	touch /var/lib/lock
	influxd -config /etc/influxdb.conf run &
	echo "CREATE DATABASE telegraf" > db
	influx < db
	sleep 5
	pkill influxd
	influxd -config /etc/influxdb.conf run
done