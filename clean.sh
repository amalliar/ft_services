#!/usr/bin/sh

kubectl delete deployments --all
kubectl delete services --field-selector metadata.name!=kubernetes
kubectl delete persistentvolumeclaims --all
