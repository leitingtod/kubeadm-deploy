#!/usr/bin/env bash

# version: 0.7.0
# appVersion:

NAME=grafana

values_file=/tmp/values.yml

echo "
server:
  image: grafana/grafana:latest
  ingress:
    enabled: true
    hosts:
      - grafana.aysaas.com
  adminPassword: admin123
  persistentVolume:
    enabled: true
    storageClass: \"aysaas-nfs\"
" >${values_file}

case "${1}" in
    del)
        helm del --purge ${NAME}
        ;;
    upgrade)
        helm upgrade ${NAME} stable/grafana --namespace kube-system -f ${values_file}
        ;;
    install)
        helm install --name ${NAME} stable/grafana --namespace kube-system -f ${values_file}
        kubectl patch -n kube-system deploy ${NAME}-grafana -p "$(cat ./tolerations.json)"
        ;;
    *)
        echo "Error: only support subcommand install | upgrade | del !"
        ;;
esac
