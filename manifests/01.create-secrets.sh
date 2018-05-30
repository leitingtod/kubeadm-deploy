#!/usr/bin/env bash

# harbor 1.4.0

kubectl create secret docker-registry harbor-registry-secret \
    --docker-server=dockerhub.aysaas.com \
    --docker-username=push \
    --docker-password=push123Q \
    --docker-email=push@aysaas.com

kubectl apply -f ./git-sshkey-secret.json
