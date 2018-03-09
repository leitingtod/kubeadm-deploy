#!/usr/bin/env bash

NAME=nginx-ingress

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/nginx-ingress \
        --namespace kube-system \
        --set rbac.create=true \
        --set controller.service.type=NodePort \
        --set controller.service.nodePorts.http=80 \
        --set controller.service.nodePorts.https=443 \
        --set controller.image.repository=dockerhub.aysaas.com/kubernetes/nginx-ingress-controller \
        --set controller.image.tag=0.9.0-beta.15 \
        --set defaultBackend.image.repository=dockerhub.aysaas.com/kubernetes/defaultbackend \
        --set defaultBackend.image.tag=1.4
fi