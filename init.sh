

sudo apt-get update
sudo apt-get upgrade -y
service nginx stop
sudo chown user42:user42 /var/run/docker.sock

minikube start --driver=docker

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f ./Sources/metallb/metallb.yaml




#METRICS PANNEL
#kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
#kubectl get deployment metrics-server -n kube-system


#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

#CREATE ADMIN
#kubectl apply -f admin_account.yaml
#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') > log.txt

#WE CAN NOW ACCES THE DASHBOARD AT 
#kubectl proxy
#http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/






#DEPLOY CONTROL PANNEL
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

#kubectl proxy &

#http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/


#IDENTIFICATION PART

#kubectl config --kubeconfig=config-demo set-credentials developer --client-certificate=fake-cert-file --client-key=fake-key-seefile
#kubectl config --kubeconfig=config-demo set-credentials experimenter --username=exp --password=some-password






#minikube config set vm-driver virtualbox
#minikube delete

#docker-machine create --driver=docker
#docker-machine start

#ln -s /sgoinfre/goinfre/Perso/edal--ce/minikube .minikube
#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)minikube start --driver=docker

