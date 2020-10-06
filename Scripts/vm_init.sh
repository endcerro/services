
sudo apt-get update
sudo apt-get upgrade -y

minikube delete
minikube config unset driver


sudo chown user42:user42 /var/run/docker.sock
minikube start --driver=docker