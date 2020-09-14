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

#Building containers
if [ $# -eq 1 ]
  then
    echo "REBUILD"
    kubectl delete -f ./Sources/Images/nginx/service.yaml
    kubectl delete -f ./Sources/Images/mysql/service.yaml
    kubectl delete -f ./Sources/Images/phpmyadmin/service.yaml
    kubectl delete -f ./Sources/Images/wordpress/service.yaml
    kubectl delete -f ./Sources/Images/ftps/service.yaml
fi

#BUILD IMAGES
eval $(minikube docker-env)
docker build -t mynginx ./Sources/Images/nginx/.
docker build -t mysql ./Sources/Images/mysql/.
docker build -t myphpmyadmin ./Sources/Images/phpmyadmin/.
docker build -t mywordpress ./Sources/Images/wordpress/.
docker build -t myftps ./Sources/Images/ftps/.
eval $(minikube docker-env)
#DEPLOY SERVICE
kubectl apply -f ./Sources/Images/nginx/service.yaml
kubectl apply -f ./Sources/Images/mysql/service.yaml
kubectl apply -f ./Sources/Images/phpmyadmin/service.yaml
kubectl apply -f ./Sources/Images/wordpress/service.yaml
kubectl apply -f ./Sources/Images/ftps/service.yaml