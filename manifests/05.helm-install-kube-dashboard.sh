#!/usr/bin/env bash

# version: 0.5.3
# appVersion: 1.8.3

NAME=kubernetes-dashboard

values_file=/tmp/values.yml

case "$1" in
    del | upgrade | install) ;;
    *)
        echo "Error: only support subcommand install | upgrade | del !"
        exit 1
        ;;
esac

if [ "$2" = "" ]; then
    echo "请指定域名！建议域名：kube-dashboard.az[Number].aysaas.com"
    exit 1
fi

echo "
rbac:
  create: true
ingress:
  enabled: true
  hosts:
    - ${2}
image:
  repository: anjia0532/google-containers.kubernetes-dashboard-amd64
  tag: v1.10.0
" >${values_file}

case "$1" in
    del)
        helm del --purge ${NAME}
        ;;
    upgrade)
        helm upgrade ${NAME} stable/kubernetes-dashboard --version 0.5.3 --namespace kube-system -f ${values_file}
        ;;
    install)
        helm install -n ${NAME} stable/kubernetes-dashboard --version 0.5.3 --namespace kube-system -f ${values_file}
        kubectl patch -n kube-system deploy ${NAME} -p "$(cat ./tolerations.json)"
        ;;
    *)
        echo "Error: only support subcommand install | upgrade | del !"
        ;;
esac
