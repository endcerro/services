#! /bin/bash
echo "Please choose either VM or 42"

read var

if [ "$var" = "VM" ] || [ "$var" = "vm" ]
  then
#  	echo 11 >> ./Scripts/servip.sh
    echo "Booting K8's in VM mode"
    bash ./Scripts/vm_init.sh
elif [ "$var" = "42" ]
  then
#  	echo 13 >> ./Scripts/servip.sh
    echo "Booting K8's in 42 mode"
    bash ./Scripts/mac_init.sh
else
	echo "Try again"
	exit 
fi

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
./Scripts/metalip.sh
kubectl apply -f ./Sources/Services/metallb.yaml
./Scripts/deploy.sh