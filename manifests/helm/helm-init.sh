#!/usr/bin/env bash

helm init --force-upgrade \
  --tiller-image="dockerhub.aysaas.com/kubernetes/tiller:v2.8.0" \
  --tiller-namespace=kube-system \
  --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts \
  --service-account=tiller

# --tiller-image="registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.7.2"





