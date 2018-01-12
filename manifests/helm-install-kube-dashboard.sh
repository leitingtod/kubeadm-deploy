#!/usr/bin/env bash
helm install -n kubernetes-dashboard stable/kubernetes-dashboard --set ingress.enabled=true --set rbac.create=true --set ingress.hosts[0]=kubernetes-dashboard.aysaas.com --set imageTag=v1.8.1 --namespace kube-system

