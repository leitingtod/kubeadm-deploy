#!/usr/bin/env bash

helm init --upgrade \
  --tiller-image="registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.7.2" \
  --tiller-namespace=kube-system \
  --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts \
  --service-account=tiller

# helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.5.1
#    --skip-refresh
#  --kube-context kubernetes-admin@kubernetes




