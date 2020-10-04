if [ $# -eq 1 ]
	then
		echo "REBUILD"
		kubectl delete -f ./Sources/Services/nginx.yaml
		kubectl delete -f ./Sources/Services/mysql.yaml
		kubectl delete -f ./Sources/Services/phpmyadmin.yaml
		kubectl delete -f ./Sources/Services/wordpress.yaml
		kubectl delete -f ./Sources/Services/ftps.yaml
		kubectl delete -f ./Sources/Services/influxdb.yaml
		kubectl delete -f ./Sources/Services/grafana.yaml
		kubectl delete -f ./Sources/Services/telegraf.yaml		
fi

#BUILD IMAGES
eval $(minikube docker-env)

docker build -t mynginx ./Sources/Images/nginx/.
kubectl apply -f ./Sources/Services/nginx.yaml

docker build -t mysql ./Sources/Images/mysql/.
kubectl apply -f ./Sources/Services/mysql.yaml

docker build -t myphpmyadmin ./Sources/Images/phpmyadmin/.
kubectl apply -f ./Sources/Services/phpmyadmin.yaml

docker build -t mywordpress ./Sources/Images/wordpress/.
kubectl apply -f ./Sources/Services/wordpress.yaml

docker build -t myftps ./Sources/Images/ftps/.
kubectl apply -f ./Sources/Services/ftps.yaml

docker build -t myinflux ./Sources/Images/influxdb/.
kubectl apply -f ./Sources/Services/influxdb.yaml

docker build -t mygrafana ./Sources/Images/grafana/.
kubectl apply -f ./Sources/Services/grafana.yaml

docker build -t mytelegraf ./Sources/Images/telegraf/.
kubectl apply -f ./Sources/Services/telegraf.yaml

#DEPLOY SERVICE

# kubectl apply -f ./Sources/Images/nginx/service.yaml

# kubectl apply -f ./Sources/Images/mysql/service.yaml

# kubectl apply -f ./Sources/Images/phpmyadmin/service.yaml

# kubectl apply -f ./Sources/Images/wordpress/service.yaml

# kubectl apply -f ./Sources/Images/ftps/service.yaml

# kubectl apply -f ./Sources/Images/influxdb/service.yaml

# kubectl apply -f ./Sources/Images/grafana/service.yaml

# kubectl apply -f ./Sources/Images/telegraf/service.yaml
