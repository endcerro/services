sudo apt-get update
sudo apt-get upgrade -y
sudo chown user42:user42 /var/run/docker.sock
minikube start --driver=docker