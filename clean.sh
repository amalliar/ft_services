#!/usr/bin/sh

kubectl delete services --field-selector metadata.name!=kubernetes
kubectl delete deployments --all
kubectl delete daemonsets --all
kubectl delete persistentvolumeclaims --all
kubectl delete configmaps --all
kubectl delete secrets --all
