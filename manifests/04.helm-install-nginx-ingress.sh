#!/usr/bin/env bash

#version: 0.8.9
#appVersion: 0.9.0-beta.15

#version: 0.9.5 appVersion: 0.10.2 error: nginx-ingress-controller:0.10.2 not exist in gcr or aliyun

NAME=nginx-ingress

values_file=/tmp/values.yml

echo "
rbac:
  create: true
controller:
  image:
    repository: dockerhub.aysaas.com/kubernetes/nginx-ingress-controller
    tag: 0.9.0-beta.15
  service:
    type: NodePort
    nodePorts:
      http: 80
      https: 443
defaultBackend:
  image:
    repository: dockerhub.aysaas.com/kubernetes/defaultbackend
    tag: 1.4
" >${values_file}

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/nginx-ingress --version 0.8.9 --namespace kube-system -f ${values_file}

    kubectl patch -n kube-system deploy ${NAME}-nginx-ingress-controller -p "$(cat ./tolerations.json)"
    kubectl patch -n kube-system deploy ${NAME}-nginx-ingress-default-backend -p "$(cat ./tolerations.json)"
fi
