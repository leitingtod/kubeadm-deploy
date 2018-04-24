#!/usr/bin/env bash

# nfs-provisioner v1.0.9

kubectl apply -f nfs/.

# schedule to master node
kubectl patch -n kube-system sts nfs-provisioner -p "$(cat ./tolerations.json)"
