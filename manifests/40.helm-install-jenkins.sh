#!/usr/bin/env bash

NAME=jenkins


if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    kubectl apply -f ci.cd/jenkins/pvc.yml

    helm install -n jenkins stable/jenkins -f ci.cd/jenkins/values.yml
fi
