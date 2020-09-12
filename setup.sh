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

eval $(minikube docker-env)

#Building containers
if [ $# -eq 1 ]
  then
    echo "REBUILD"
    kubectl delete -f ./Sources/Images/nginx/service.yaml
    kubectl delete -f ./Sources/Images/mysql/service.yaml
fi

#BUILD IMAGES
docker build -t mynginx ./Sources/Images/nginx/.
eval $(minikube docker-env)
#DEPLOY SERVICE
kubectl apply -f ./Sources/Images/nginx/service.yaml
eval $(minikube docker-env)
docker build -t mymysql ./Sources/Images/mysql/.
eval $(minikube docker-env)
#DEPLOY SERVICE
kubectl apply -f ./Sources/Images/mysql/service.yaml
eval $(minikube docker-env)