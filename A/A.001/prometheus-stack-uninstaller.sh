#!/usr/bin/env bash

helm uninstall -n monitoring prometheus-stack

kubectl -n monitoring delete pvc prometheus-prometheus-stack-kube-prom-prometheus-db-prometheus-prometheus-stack-kube-prom-prometheus-0