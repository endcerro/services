#! /bin/bash

function install_kb()
{
	sudo rm -rf /usr/local/bin/kubectl
	sudo rm -rf /usr/local/bin/minikube

	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
	curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	chmod +x minikube
	sudo mkdir -p /usr/local/bin/
	sudo cp minikube /usr/local/bin && rm minikube
	#sudo install minikube /usr/local/bin/
}

function install_mtl()
{
	kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

}

function vm_init()
{
	sudo usermod -aG sudo $USER
	sudo apt-get update -y
	sudo apt-get -y dist-upgrade
	sudo apt-get install docker.io
	sudo systemctl start docker
	sudo systemctl enable docker
	install_kb
	#minikube delete
	#minikube config unset driver
	sudo chown user42:user42 /var/run/docker.sock

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
    minikube start --driver=docker --bootstrapper=kubeadm
    if [[ $? == 0 ]]
	then
    	eval $($sudo minikube docker-env)
		echo -ne "$_GREEN➜$_YELLOW Minikube started\n"
	else
		$sudo minikube delete
    	echo -ne "$_RED➜$_YELLOW Error occured\n"
    	exit
	fi
elif [ $(uname) = "Darwin" ]
  then
    echo "Booting K8's in 42 mode"
    mac_init
fi

SERVICES="nginx mysql wordpress phpmyadmin ftps influxdb telegraf grafana"

minikube addons enable metallb
#kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
install_mtl
metalip
kubectl apply -f ./Sources/Services/metallb.yaml

read a

#eval $(minikube docker-env)
for svc in $SERVICES
do
	if [ $svc = "mysql" ]
	then
		sqlip
	fi
	deploy $svc
done
sudo minikube dashboard  &

#deploy nginx
#deploy phpmyadmin
#deploy wordpress
#deploy ftps
#deploy influxdb
#deploy grafana
#deploy telegraf
#sqlip
#deploy mysql

#sudo minikube dashboard &
