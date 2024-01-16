#!/usr/bin/env bash

BASE_DIR="$HOME/_Lecture_prom_learning.kit/A/A.005"

echo "Delete alert-target-nginx"
kubectl delete -f $BASE_DIR/4-2.alert-target-nginx/

echo "Delete alertmanager"
kubectl delete -f $BASE_DIR/3-2.alertmanager.yaml

echo "Delete kube-state-metrics"
kubectl delete -f $BASE_DIR/2-2.kube-state-metrics.yaml

echo "Delete node-exporter"
kubectl delete -f $BASE_DIR/2-1.prometheus-server.yaml

echo "Delete prometheus-server and config also namespace."
kubectl delete configmap -n monitoring prometheus-server
kubectl delete -f $BASE_DIR/1.prometheus-server.yaml

echo "delete success all native-prometheus apps."
