#!/usr/bin/env bash

NAME=grafana

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/grafana \
        --namespace kube-system \
        --set rbac.create=true \
        --set server.persistentVolume.enabled=true \
        --set server.persistentVolume.storageClass="aysaas-nfs-once" \
        --set server.image=dockerhub.aysaas.com/kubernetes/grafana/grafana:4.6.3
fi

