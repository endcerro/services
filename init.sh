# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/10 23:42:48 by hpottier          #+#    #+#              #
#    Updated: 2020/03/11 02:48:56 by hpottier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

brew install kubectl
brew install minikube

minikube config set vm-driver virtualbox
minikube delete

docker-machine create --driver virtualbox default
docker-machine start

#ln -s /sgoinfre/goinfre/Perso/edal--ce/minikube .minikube
#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)