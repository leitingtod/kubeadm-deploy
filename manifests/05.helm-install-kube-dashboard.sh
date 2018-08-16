#!/usr/bin/env bash

# version: 0.5.3
# appVersion: 1.8.3

NAME=kubernetes-dashboard

if [ "${1}" = "del" ]; then
	helm del --purge ${NAME}
else
	if [ "$1" = "" ]; then
		echo "请指定域名！建议域名：kube-dashboard.az[Number].aysaas.com"
		exit 1
	fi

	values_file=/tmp/values.yml

	echo "
rabc:
  create: true
ingress:
  enabled: true
  hosts:
    - ${1}
image:
  repository: dockerhub.aysaas.com/kubernetes/kubernetes-dashboard-amd64
  tag: v1.8.3
" >${values_file}

	helm install -n ${NAME} stable/kubernetes-dashboard --version 0.5.3 --namespace kube-system -f ${values_file}

	kubectl patch -n kube-system deploy ${NAME} -p "$(cat ./tolerations.json)"
fi
