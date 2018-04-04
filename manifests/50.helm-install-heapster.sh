#!/usr/bin/env bash

NAME=heapster

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/heapster \
        --namespace kube-system \
        --set rbac.create=true \
        --set image.repository=dockerhub.aysaas.com/kubernetes/heapster \
        --set image.tag=v1.3.0 \
        --set resizer.image.repository=dockerhub.aysaas.com/kubernetes/addon-resizer \
        --set resizer.image.tag=1.7 \
        --set eventer.enabled=true
fi