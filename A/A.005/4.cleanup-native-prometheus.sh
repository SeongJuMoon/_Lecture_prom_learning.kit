#!/usr/bin/env bash

BASE_DIR="$HOME/_Lecture_prom_learning.kit/A/A.005"

echo "Delete kube-state-metrics"
kubectl delete -f $BASE_DIR/2-3.kube-state-metrics.yaml

echo "Delete node-exporter"
kubectl delete -f $BASE_DIR/2-1.node-exporter.yaml

echo "Delete namespace prometheus-server deployment & configmap"
kubectl delete configmap -n monitoring prometheus-server
kubectl delete -f $BASE_DIR/1-1.prometheus-server.yaml

echo "delete success all native prometheus apps."
