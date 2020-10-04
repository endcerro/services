#! /bin/bash



echo "Please type VM or 42"

read var

if [ "$var" = "VM" ] || [ "$var" = "vm" ]
  then
    echo "Booting K8's in VM mode"
    bash ./init.sh
elif [ "$var" = "42" ]
  then
    echo "Booting K8's in 42 mode"
    bash ./macinit.sh
fi

./setup.sh
#minikube ip >> Sources/metallb/metallbR.yaml

#kubectl apply -f ./Sources/metallb/metallb.yaml
#bash ./setup.sh