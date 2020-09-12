brew install kubectl
brew install minikube
brew upgrade kubectl
brew upgrade minikube
minikube config set vm-driver virtualbox
minikube delete
docker-machine create --driver virtualbox default
docker-machine start

minikube start --vm-driver=virtualbox

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f ./Sources/metallb/metallb.yaml