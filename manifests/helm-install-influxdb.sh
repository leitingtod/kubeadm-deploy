#!/usr/bin/env bash
helm install --name influxdbd stable/influxdb \
    --namespace kube-system \
    --set rbac.create=true