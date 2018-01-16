#!/usr/bin/env bash
helm install -n jenkins stable/jenkins \
    --set rbac.install=true \
    --set Persistence.Enabled=false \
    --set Master.Ingress.Annotations="kubernetes.io/ingress.class: nginx" \
    --set Master.ServiceType=NodePort