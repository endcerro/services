brew install kubectl
brew install minikube
brew upgrade kubectl
brew upgrade minikube

minikube delete
minikube config set vm-driver virtualbox

docker-machine create --driver virtualbox default
docker-machine start
minikube start --vm-driver=virtualbox