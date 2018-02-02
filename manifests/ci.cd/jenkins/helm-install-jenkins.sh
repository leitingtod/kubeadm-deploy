#!/usr/bin/env bash

NAME=jenkins

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install -n jenkins stable/jenkins \
        --set rbac.install=true \
        --set Persistence.Enabled=true \
        --set Persistence.ExistingClaim="jenkins-jenkins" \
        --set Master.Image="dockerhub.aysaas.com/kubernetes/jenkins/jenkins" \
        --set Master.ImageTag="lts-alpine" \
        --set Master.ServiceType=ClusterIP \
        --set Master.InstallPlugins="" \
        --set Master.HostName="jenkins.az1.aysaas.com"
fi

#    --set Persistence.Annotations="volume.beta.kubernetes.io/storage-class: aysaas-nfs" \
#    --set Persistence.StorageClass="aysaas-nfs" \

    #--set Master.Ingress.Annotations{="kubernetes.io/ingress.class":"nginx"}

#     --set Agent.ImageTag="" \