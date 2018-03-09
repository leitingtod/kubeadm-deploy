#!/usr/bin/env bash
kubectl create secret docker-registry harbor-registry-secret \
    --docker-server=dockerhub.aysaas.com \
    --docker-username=liuyazhou \
    --docker-password=leiting88Q \
    --docker-email=leitingtod@126.com