#!/usr/bin/env bash
helm install --name heapster stable/heapster \
    --namespace kube-system \
    --set rbac.create=true