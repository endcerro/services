if [ $# -eq 1 ]
	then
		echo "REBUILD"
		kubectl delete -f ./Sources/Images/nginx/service.yaml
		kubectl delete -f ./Sources/Images/mysql/service.yaml
		kubectl delete -f ./Sources/Images/phpmyadmin/service.yaml
		kubectl delete -f ./Sources/Images/wordpress/service.yaml
		kubectl delete -f ./Sources/Images/ftps/service.yaml
		kubectl delete -f ./Sources/Images/ftps/service.yaml
		kubectl delete -f ./Sources/Images/influxdb/service.yaml
		kubectl delete -f ./Sources/Images/grafana/service.yaml
fi

#BUILD IMAGES
eval $(minikube docker-env)
docker build -t mynginx ./Sources/Images/nginx/.
docker build -t mysql ./Sources/Images/mysql/.
docker build -t myphpmyadmin ./Sources/Images/phpmyadmin/.
docker build -t mywordpress ./Sources/Images/wordpress/.
docker build -t myftps ./Sources/Images/ftps/.
docker build -t myinflux ./Sources/Images/influxdb/.
docker build -t mygrafana ./Sources/Images/grafana/.
eval $(minikube docker-env)
#DEPLOY SERVICE
kubectl apply -f ./Sources/Images/nginx/service.yaml
kubectl apply -f ./Sources/Images/mysql/service.yaml
kubectl apply -f ./Sources/Images/phpmyadmin/service.yaml
kubectl apply -f ./Sources/Images/wordpress/service.yaml
kubectl apply -f ./Sources/Images/ftps/service.yaml
kubectl apply -f ./Sources/Images/influxdb/service.yaml
kubectl apply -f ./Sources/Images/grafana/service.yaml