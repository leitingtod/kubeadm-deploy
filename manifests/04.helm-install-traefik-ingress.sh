#!/usr/bin/env bash

#version: 1.24.1
#appVersion: 1.7.0-rc3

# traefik的性能不足以支撑17个qycloud-release(每个13个svc)，频繁重启或Crash

NAME=traefik-ingress

values_file=/tmp/values.yml

echo "
imageTag: v1.7.0-rc3
rbac:
  enabled: true
serviceType: NodePort
service:
  nodePorts:
    http: 80
    https: 443
dashboard:
  enabled: true
  domain: traefik.aysaas.com
kubernetes:
  namespaces:
    - default
    - kube-system
accessLogs:
  enabled: true
" >${values_file}

if [ ${1}x == "delx" ]; then
    helm del --purge ${NAME}
else
    helm install --name ${NAME} stable/traefik --version 1.24.1 \
        --namespace kube-system \
        -f ${values_file}

    kubectl patch -n kube-system deploy ${NAME} -p "$(cat ./tolerations.json)"
fi
