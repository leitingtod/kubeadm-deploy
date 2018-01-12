#!/usr/bin/env bash
helm install --name grafana stable/grafana --set server.service.type=NodePort --set rbac.create=true --namespace kube-system --set server.persistentVolume.enabled=false
