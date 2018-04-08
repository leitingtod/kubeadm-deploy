#!/usr/bin/env bash

# version: 0.4.1
# appVersion: 1.7.1

NAME=kubernetes-dashboard


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    if [ $1 == "" ]; then
        echo "请指定域名！建议域名：kube-dashboard.az[数字].aysaas.com"
    fi

    helm install -n ${NAME} aysaas/kubernetes-dashboard --version 0.4.1 \
        --namespace kube-system \
        --set ingress.enabled=true \
        --set rbac.create=true \
        --set ingress.hosts[0]=${1} \
        --set image=dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64 \
        --set imageTag=v1.8.3
fi

