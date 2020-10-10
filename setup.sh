#! /bin/bash

function vm_init()
{
	sudo apt-get update
	sudo apt-get upgrade -y
	minikube delete
	minikube config unset driver
	sudo chown user42:user42 /var/run/docker.sock
	minikube start --driver=docker
}

function mac_init()
{
	brew install kubectl
	brew install minikube
	brew upgrade kubectl
	brew upgrade minikube

	minikube delete
	minikube config set vm-driver virtualbox

	docker-machine create --driver virtualbox default
	docker-machine start
	minikube start --vm-driver=virtualbox
}

function metalip()
{
	cp ./Sources/Services/metallbT.yaml ./Sources/Services/metallb.yaml
	baseip=$(minikube ip 2>&1)
	endip=$(echo $baseip | sed 's/\.[0-9]*$/.0/' | rev | cut -c2- | rev 2>&1)
	endip=$(echo "$endip"'245' 2>&1)
	echo "$baseip""-""$endip" >> ./Sources/Services/metallb.yaml
	cp ./Sources/Images/telegraf/telegrafT.conf ./Sources/Images/telegraf/telegraf.conf
	echo "	url = \"https://""$baseip"":10250\"" >> ./Sources/Images/telegraf/telegraf.conf
}

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

function deploy()
{
	docker build -t my$1 ./Sources/Images/$1/.
	kubectl apply -f ./Sources/Services/$1.yaml
}

function rdeploy()
{
	kubectl delete -f ./Sources/Services/$1.yaml
	deploy $1
}

if [ $(uname) = "Linux" ]
  then
    echo "Booting K8's in VM mode"
    vm_init
elif [ $(uname) = "Darwin" ]
  then
    echo "Booting K8's in 42 mode"
    mac_init
fi

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
metalip
kubectl apply -f ./Sources/Services/metallb.yaml

eval $(minikube docker-env)

deploy nginx
deploy phpmyadmin
deploy wordpress
deploy ftps
deploy influxdb
deploy grafana
deploy telegraf
sqlip
deploy mysql

minikube dashboard
