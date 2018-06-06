#!/usr/bin/env bash

# harbor 1.4.0

kubectl create secret docker-registry harbor-registry-secret \
    --docker-server=dockerhub.aysaas.com \
    --docker-username=push \
    --docker-password=push123Q \
    --docker-email=push@aysaas.com

kubectl create secret generic git-sshkey-default --from-file=ssh_privatekey=/root/.ssh/id_rsa --from-file=ssh_publickey=/root/.ssh/id_rsa.pub
