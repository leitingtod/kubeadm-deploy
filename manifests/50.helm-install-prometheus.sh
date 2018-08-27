#!/usr/bin/env bash

#version: 5.4.0
#appVersion:

NAME=prometheus

values_file=/tmp/values.yml

echo "
rbac:
  create: true
alertmanager:
  image:
    tag: latest
    pullPolicy: Always
  persistentVolume:
    enabled: true
    storageClass: \"aysaas-nfs\"
  ingress:
    enabled: true
    hosts:
    - prometheus.aysaas.com/alertmanager
pushgateway:
  image:
    tag: latest
    pullPolicy: Always
  ingress:
    enabled: true
    hosts:
      - prometheus.aysaas.com/pushgateway
server:
  image:
    tag: latest
    pullPolicy: Always
  persistentVolume:
    enabled: true
    storageClass: \"aysaas-nfs\"
  ingress:
    enabled: true
    hosts:
      - prometheus.aysaas.com
pushgateway:
  image:
    tag: latest
    pullPolicy: Always

kubeStateMetrics:
  image:
    repository: anjia0532/google-containers.kube-state-metrics-amd64
    tag: v1.3.1
configmapReload:
  image:
    tag: latest
" >${values_file}

case "${1}" in
    del)
        helm del --purge ${NAME}
        ;;
    upgrade)
        helm upgrade ${NAME} stable/prometheus --namespace kube-system -f ${values_file}
        ;;
    install)
        helm install --name ${NAME} stable/prometheus --namespace kube-system -f ${values_file}
        kubectl patch -n kube-system deploy ${NAME}-prometheus-server -p "$(cat ./tolerations.json)"
        kubectl patch -n kube-system deploy ${NAME}-prometheus-pushgateway -p "$(cat ./tolerations.json)"
        kubectl patch -n kube-system deploy ${NAME}-prometheus-alertmanager -p "$(cat ./tolerations.json)"
        kubectl patch -n kube-system deploy ${NAME}-prometheus-kube-state-metrics -p "$(cat ./tolerations.json)"
        ;;
    *)
        echo "Error: only support subcommand install | upgrade | del !"
        ;;
esac
