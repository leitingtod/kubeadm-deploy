#!/usr/bin/env bash

HELM_HOME_DIR="/root/.helm"

mkdir -p ${HELM_HOME_DIR}

cp helm /usr/local/bin
chmod +x /usr/local/bin/helm

helm init --upgrade \
  --tiller-image="registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.7.2"\
  --tiller-namespace=kube-system \
  --service-account=tiller

# helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.5.1
#    --skip-refresh
#    --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts

umask 022 && helm completion bash >/etc/bash_completion.d/helm.sh

