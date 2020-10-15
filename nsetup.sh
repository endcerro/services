#! /bin/bash
sudo apt-get update -y
sudo apt-get -y dist-upgrade

sudo apt-get autoremove -y
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo chown user42:user42 /var/run/docker.sock

sudo usermod -aG sudo $USER


echo "Removing Kubectl and Minikube"

sudo rm -rf /usr/local/bin/kubectl
sudo rm -rf /usr/local/bin/minikube


echo "Installing Kubectl"

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "Installing Minikube"

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo cp minikube /usr/local/bin && rm minikube

echo "Starting Minikube"

minikube delete
minikube start --driver=docker

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
./Scripts/metalip.sh
read a
kubectl apply -f ./Sources/Services/metallb.yaml

minikube dashboard &
./Scripts/deploy.sh
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
