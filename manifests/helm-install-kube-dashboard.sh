#!/usr/bin/env bash
helm install -n kubernetes-dashboard stable/kubernetes-dashboard \
    --namespace kube-system \
    --set ingress.enabled=true \
    --set rbac.create=true \
    --set ingress.hosts[0]=kubernetes-dashboard.az1.aysaas.com \
    --set image=dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64 \
    --set imageTag=v1.8.2

