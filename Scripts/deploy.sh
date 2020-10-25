function servip()
{
	kubectl get services  | grep $1 | awk '{print $4}' | grep .
}

function sqlip()
{
	ip=$(servip wordpress)
	cat ./Sources/Images/mysql/mysql.sql > ./Sources/Images/mysql/new.sql
	echo "(1, 'siteurl', 'http://"$ip":5050', 'yes')," >> ./Sources/Images/mysql/new.sql
	echo "(2, 'home', 'http://"$ip":5050', 'yes')," >> ./Sources/Images/mysql/new.sql
	cat ./Sources/Images/mysql/2.sql >> ./Sources/Images/mysql/new.sql
}

function ftpsip()
{
	ip=$(servip wordpress)
	cat ./Sources/Images/ftps/vsftpd.conf1 > ./Sources/Images/ftps/vsftpd.conf 
	echo "pasv_address="$ip"" >> ./Sources/Images/ftps/vsftpd.conf
	cat ./Sources/Images/ftps/vsftpd.conf2 >> ./Sources/Images/ftps/vsftpd.conf
}

function deploy()
{
	docker build -t $1 ./Sources/Images/$1/.
	kubectl apply -f ./Sources/Services/$1.yaml
}

function rdeploy()
{
	kubectl delete -f ./Sources/Services/$1.yaml
	deploy $1
}

eval $(minikube docker-env)


deploy influxdb
deploy telegraf
deploy grafana
deploy nginx
deploy wordpress
deploy phpmyadmin
sqlip
deploy mysql
ftpsip
deploy ftps