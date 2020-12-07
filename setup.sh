#!/usr/bin/sh

LGREEN="\033[1;32m"
NOC="\033[0m"

minikube status | grep Running > /dev/null
if [[ $? != 0 ]]
then
    echo -e "$LGREEN==>$NOC Starting minikube..."
    minikube start --addons=default-storageclass --addons=metallb \
        --addons=storage-provisioner --addons=dashboard --addons=metrics-server
fi

# We want to use the docker server inside of a
# minikube VM / docker container.
eval $(minikube -p minikube docker-env)
echo -e "$LGREEN==>$NOC Building Docker images..."
docker build -t amalliar/nginx:latest ./srcs/docker/nginx
docker build -t amalliar/mysql:latest ./srcs/docker/mysql
docker build -t amalliar/phpmyadmin:latest ./srcs/docker/phpmyadmin
docker build -t amalliar/wordpress:latest ./srcs/docker/wordpress
docker build -t amalliar/ftps:latest ./srcs/docker/ftps
docker build -t amalliar/influxdb:latest ./srcs/docker/influxdb
docker build -t amalliar/telegraf:latest ./srcs/docker/telegraf
docker build -t amalliar/grafana:latest ./srcs/docker/grafana

echo -e "$LGREEN==>$NOC Define secrets..."
kubectl create secret generic influxdb-secret \
  --from-literal=INFLUXDB_DB=telegraf \
  --from-literal=INFLUXDB_USER=telegraf \
  --from-literal=INFLUXDB_USER_PASSWORD=telegraf \
  --from-literal=INFLUXDB_HOST=influxdb-service \
  --from-literal=INFLUXDB_HTTP_AUTH_ENABLED=false
kubectl create secret generic grafana-secret \
  --from-literal=GF_SECURITY_ADMIN_USER=root \
  --from-literal=GF_SECURITY_ADMIN_PASSWORD=toor

echo -e "$LGREEN==>$NOC Applying manifests..."
kubectl apply -f ./srcs/k8s
minikube dashboard --url=false
