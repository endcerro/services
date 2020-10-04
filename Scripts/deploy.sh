eval $(minikube docker-env)

docker build -t mynginx ../Sources/Images/nginx/.
kubectl apply -f ../Sources/Services/nginx.yaml

docker build -t mysql ../Sources/Images/mysql/.
kubectl apply -f ../Sources/Services/mysql.yaml

docker build -t myphpmyadmin ../Sources/Images/phpmyadmin/.
kubectl apply -f ../Sources/Services/phpmyadmin.yaml

docker build -t mywordpress ../Sources/Images/wordpress/.
kubectl apply -f ../Sources/Services/wordpress.yaml

docker build -t myftps ../Sources/Images/ftps/.
kubectl apply -f ../Sources/Services/ftps.yaml

docker build -t myinflux ../Sources/Images/influxdb/.
kubectl apply -f ../Sources/Services/influxdb.yaml

docker build -t mygrafana ../Sources/Images/grafana/.
kubectl apply -f ../Sources/Services/grafana.yaml

docker build -t mytelegraf ../Sources/Images/telegraf/.
kubectl apply -f ../Sources/Services/telegraf.yaml