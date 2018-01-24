#!/usr/bin/env bash

helm install -n jenkins stable/jenkins \
    --set rbac.install=true \
    --set Persistence.Enabled=true \
    --set Persistence.ExistingClaim="jenkins-jenkins" \
    --set Master.ImageTag="lts-slim" \
    --set Master.ServiceType=ClusterIP \
    --set Master.InstallPlugins="" \
    --set Master.HostName="jenkins.aysaas.com"

#    --set Persistence.Annotations="volume.beta.kubernetes.io/storage-class: aysaas-nfs" \
#    --set Persistence.StorageClass="aysaas-nfs" \

    #--set Master.Ingress.Annotations{="kubernetes.io/ingress.class":"nginx"}

#     --set Agent.ImageTag="" \