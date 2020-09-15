sudo apt-get update
sudo apt-get upgrade -y
#service nginx stop
sudo chown user42:user42 /var/run/docker.sock

minikube start --driver=docker

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f ./Sources/metallb/metallb.yaml
