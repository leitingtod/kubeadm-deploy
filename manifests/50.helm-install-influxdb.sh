#!/usr/bin/env bash

# version: 0.8.2

NAME=influxdb


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/influxdb \
        --namespace kube-system \
        --set rbac.create=true \
        --set image.repo=dockerhub.aysaas.com/kubernetes/influxdb \
        --set image.tag=1.4.2-alpine \
        --set persistence.enabled=true \
        --set persistence.storageClass="aysaas-nfs-once"
fi
