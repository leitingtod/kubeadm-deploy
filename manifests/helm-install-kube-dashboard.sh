#!/usr/bin/env bash

NAME=kubernetes-dashboard

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    if [ $1 == "" ]; then
        echo "请指定域名！域名建议：kube-dashboard.az[3].aysaas.com"
    fi

    helm install -n ${NAME} stable/kubernetes-dashboard \
        --namespace kube-system \
        --set ingress.enabled=true \
        --set rbac.create=true \
        --set ingress.hosts[0]=${1} \
        --set image=dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64 \
        --set imageTag=v1.8.2
fi
