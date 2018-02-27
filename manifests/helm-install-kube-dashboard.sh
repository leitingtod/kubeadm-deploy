#!/usr/bin/env bash

NAME=kubernetes-dashboard

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install -n ${NAME} stable/kubernetes-dashboard \
        --namespace kube-system \
        --set ingress.enabled=true \
        --set rbac.create=true \
        --set ingress.hosts[0]=kubernetes-dashboard.az3.aysaas.com \
        --set image.repository=dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64 \
        --set image.tag=v1.8.2
fi
