#!/usr/bin/env bash
helm install --name nginx-ingress stable/nginx-ingress \
    --namespace kube-system \
    --set rbac.create=true \
    --set controller.service.type=NodePort \
    --set controller.service.nodePorts.http=80 \
    --set controller.service.nodePorts.https=443 \
    --set controller.image.repository=dockerhub.aysaas.com/kubernetes/nginx-ingress-controller \
    --set controller.image.tag=0.9.0-beta.15 \
    --set defaultBackend.image.repository=dockerhub.aysaas.com/kubernetes/defaultbackend \
    --set defaultBackend.image.tag=1.4
