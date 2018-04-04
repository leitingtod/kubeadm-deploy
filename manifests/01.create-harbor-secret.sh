#!/usr/bin/env bash
kubectl create secret docker-registry harbor-registry-secret \
    --docker-server=dockerhub.aysaas.com \
    --docker-username=push \
    --docker-password=push123Q \
    --docker-email=push@aysaas.com