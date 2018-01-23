#!/usr/bin/env bash

helm install -n jenkins stable/jenkins \
    --set rbac.install=true \
    --set Persistence.Enabled=true \
    --set Persistence.ExistingClaim="jenkins-nfs-pvc001" \
    --set Master.ServiceType=ClusterIP \
    --set Master.InstallPlugins="" \
    --set Master.HostName="jenkins.aysaas.com"

    #--set Master.Ingress.Annotations{="kubernetes.io/ingress.class":"nginx"}
