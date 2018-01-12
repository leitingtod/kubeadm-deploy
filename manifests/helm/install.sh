#!/usr/bin/env bash

HELM_HOME_DIR="/root/.helm"

mkdir -p ${HELM_HOME_DIR}

ls *.yml | xargs -i kubectl create -f {}

cp helm /usr/local/bin
chmod +x /usr/local/bin/helm

umask 022 && helm completion bash >/etc/bash_completion.d/helm.sh
