#!/usr/bin/env bash
helm install --name grafana stable/grafana \
    --namespace kube-system \
    --set server.service.type=NodePort \
    --set rbac.create=true \
    --set server.persistentVolume.enabled=false

