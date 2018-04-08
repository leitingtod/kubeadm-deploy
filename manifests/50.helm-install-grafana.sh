#!/usr/bin/env bash

# version: 0.7.0
# appVersion:

NAME=grafana


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/grafana \
        --namespace kube-system \
        --set rbac.create=true \
        --set server.persistentVolume.enabled=true \
        --set server.persistentVolume.storageClass="aysaas-nfs-once" \
        --set server.image=grafana/grafana:5.0.4
fi
