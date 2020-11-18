#!/usr/bin/sh

# We want to use the docker server inside of a minikube VM / docker container.
eval $(minikube docker-env)

echo "==> Building Docker images..."
docker build -t amalliar/nginx-ssh:latest ./srcs/docker/nginx-ssh && \
echo "==> Done." && \
echo "==> Applying manifests..." && \
kubectl apply -f ./srcs/k8s && \
echo "==> Done."
