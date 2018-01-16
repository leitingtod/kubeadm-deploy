#!/usr/bin/env bash

helm install --name concourse stable/concourse \
  --set concourse.insecureDockerRegistry=dockerhub.aysaas.com \
  --set web.ingress.enabled=true \
  --set web.ingress.annotations[0]="kubernetes.io/ingress.class: nginx" \
  --set web.ingress.hosts[0]="ci.aysaas.com" \
  --set persistence.enabled=false \
  --set postgresql.persistence.enabled=false \
  --set imageTag=3.8.0

  #--set persistence.worker.class="concourse-pv"

  #--set web.service.type=ClusterIP