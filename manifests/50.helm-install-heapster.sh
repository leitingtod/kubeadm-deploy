#!/usr/bin/env bash

# version: 0.2.7

NAME=heapster


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/heapster \
        --namespace kube-system \
        --set rbac.create=true \
        --set eventer.enabled=true

    kubectl patch -n kube-system deploy ${NAME}-heapster -p "$(cat ./tolerations.json)"
fi

#        --set image.repository=dockerhub.aysaas.com/kubernetes/heapster \
#        --set image.tag=v1.3.0 \
#        --set resizer.image.repository=dockerhub.aysaas.com/kubernetes/addon-resizer \
#        --set resizer.image.tag=1.7 \
