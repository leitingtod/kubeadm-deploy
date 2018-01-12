#!/usr/bin/env bash
helm install --name heapster stable/heapster --set rbac.create=true --namespace kube-system