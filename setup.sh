# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/21 12:12:21 by hpottier          #+#    #+#              #
#    Updated: 2020/07/12 14:15:28 by edal--ce         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# docker rmi -f $(docker images -q)

# Starts minikube
# minikube start --vm-driver=virtualbox

#Building containers
if [ $# -eq 1 ]
  then
    echo "RM TIME"
    kubectl delete -n default deployment nginx-deployment
    kubectl delete -n default service nginx-deployment
fi

#DEPLOY NGINX
eval $(minikube docker-env)
docker build -t mynginx ./Sources/Images/nginx/.
#kubectl apply -f ./Sources/Images/nginx/nginx.yaml
#kubectl get pods -l run=mynginx -o wide

#POD IS RUNNING AT THIS POINT

#CREATE DEPLOYMENT

eval $(minikube docker-env)

kubectl apply -f ./Sources/Images/nginx/deployment.yaml
#CREQTE DEPLOYMENT
kubectl expose deployment nginx-deployment --type=LoadBalancer --port=80
#SEE IT
#minikube service nginx-deployment


#CREATE SERVICE AND EXPOSE DEPLOYMENT
#kubectl expose deployment nginx-deployment --type=NodePort --name=nginx-service

#kubectl expose deployment mynginx --port=80 --type=LoadBalancer
#kubectl expose deployment/mynginx --type="NodePort" --port 8080


#kubectl expose deployment/mynginx

#docker build -t ftps ./Sources/Images/ftps/.

#Starting containers
#docker run -p 80:80 -p 443:443 --rm --name nginx -d nginx
#docker run -p 21:21 --rm --name ftps -d ftps


#docker run -p 127.0.0.1:80:80 -p 127.0.0.1:8080:8080 -p 127.0.0.1:8081:8081 -it latest

#docker run -it --entrypoint /bin/sh -p 21:21 --name ftps -d ftps