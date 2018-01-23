#!/usr/bin/env bash

helm install -n drone . \
    --set ingress.enabled=true \
    --set ingress.annotations[0]="kubernetes.io/ingress.class: nginx" \
    --set ingress.hosts[0]="drone.aysaas.com" \
    --set persistence.enabled=false

helm upgrade drone \
    --reuse-values \
    --set server.env.DRONE_PROVIDER="github" \
    --set server.env.DRONE_ADMIN=admin \
    --set server.env.DRONE_OPEN=true \
    --set server.env.DRONE_GITHUB=true \
    --set server.env.DRONE_GITHUB_URL=https://github.com \
    --set server.env.DRONE_GITHUB_CLIENT=af248b3b2fbedd792ea3 \
    --set server.env.DRONE_GITHUB_SECRET=27ffa15f223f03f9d2795f66cc7dad9bc23b919d \
    --set server.env.DRONE_GITHUB_MERGE_REF=true \
    --set server.env.DRONE_GITHUB_CONTEXT=continuous-integration/drone \
    --set server.env.DRONE_GITHUB_SKIP_VERIFY=true \
    --set server.env.DRONE_GITHUB_GIT_USERNAME=leitingtod@gmail.com \
    --set server.env.DRONE_GITHUB_GIT_PASSWORD=liuyazhou88 \
    --set server.env.DRONE_GITHUB_PRIVATE_MODE=false \
    --set server.env.DRONE_GITHUB_SCOPE="repo repo:status user:email read:org" .

#--set server.env.DRONE_ADMIN=admin \
#--set server.env.DRONE_ORGS="safirst" \
