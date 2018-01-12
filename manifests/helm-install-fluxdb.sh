#!/usr/bin/env bash
helm install --name influxdbd stable/influxdb --set rbac.create=true --namespace kube-system