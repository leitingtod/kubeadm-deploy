#!/usr/bin/env bash

# version: 0.5.3
# appVersion: 1.8.3

NAME=kubernetes-dashboard


if [ "${1}" = "del" ]; then
    helm del --purge ${NAME}
else
    if [ "$1" = "" ]; then
        echo "请指定域名！建议域名：kube-dashboard.az[Number].aysaas.com"
        exit 1
    fi

    helm install -n ${NAME} stable/kubernetes-dashboard --version 0.5.3 \
        --namespace kube-system \
        --set rbac.create=true \
        --set ingress.enabled=true \
        --set ingress.hosts[0]=${1} \
        --set image.repository=dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64 \
        --set image.tag=v1.8.3

    kubectl patch -n kube-system deploy ${NAME} -p "$(cat ./tolerations.json)"
fi
