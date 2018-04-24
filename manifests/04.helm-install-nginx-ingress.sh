#!/usr/bin/env bash

#version: 0.8.9
#appVersion: 0.9.0-beta.15

#version: 0.9.5 appVersion: 0.10.2 error: nginx-ingress-controller:0.10.2 not exist in gcr or aliyun

NAME=nginx-ingress


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/nginx-ingress --version 0.8.9 \
        --namespace kube-system \
        --set rbac.create=true \
        --set controller.service.type=NodePort \
        --set controller.service.nodePorts.http=80 \
        --set controller.service.nodePorts.https=443 \
        --set controller.image.repository=dockerhub.aysaas.com/kubernetes/nginx-ingress-controller \
        --set controller.image.tag=0.9.0-beta.15 \
        --set defaultBackend.image.repository=dockerhub.aysaas.com/kubernetes/defaultbackend \
        --set defaultBackend.image.tag=1.4

    kubectl patch -n kube-system deploy ${NAME}-nginx-ingress-controller -p "$(cat ./tolerations.json)"
    kubectl patch -n kube-system deploy ${NAME}-nginx-ingress-default-backend -p "$(cat ./tolerations.json)"

fi
