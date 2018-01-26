#!/usr/bin/env bash
helm install --name nginx-ingress stable/nginx-ingress \
    --set rbac.create=true \
    --set controller.service.type=NodePort \
    --set controller.service.nodePorts.http=80 \
    --set controller.service.nodePorts.https=443
