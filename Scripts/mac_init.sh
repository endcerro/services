brew install kubectl
brew install minikube
brew upgrade kubectl
brew upgrade minikube

minikube config set vm-driver virtualbox
minikube delete
docker-machine create --driver virtualbox default
docker-machine start
minikube start --vm-driver=virtualbox