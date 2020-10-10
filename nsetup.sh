function deploy()
{
	eval $(minikube docker-env)

	docker build -t $1 ./Sources/Images/$1/.
	kubectl apply -f ./Sources/Services/$1.yaml
}

function rdeploy()
{
	kubectl delete -f ./Sources/Services/$1.yaml
	deploy $1
}

eval $(minikube docker-env)

deploy nginx
deploy wordpress