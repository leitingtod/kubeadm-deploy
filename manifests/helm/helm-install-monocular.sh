#!/usr/bin/env bash

helm install -n monocular monocular/monocular \
    --set api.service.type=ClusterIP \
    --set ui.service.type=ClusterIP \
    --set prerender.service.type=ClusterIP
