eval $($sudo minikube docker-env)
docker build -t my$1 ./Sources/Images/$1/.
kubectl apply -f ./Sources/Services/$1.yaml
