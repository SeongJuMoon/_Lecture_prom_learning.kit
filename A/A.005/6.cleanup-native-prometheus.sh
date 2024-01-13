#!/usr/bin/env bash

BASE_DIR="$HOME/_Lecture_prom_learning.kit/A/A.005"

echo "Delete sample-app(nginx)"
kubectl delete -f $BASE_DIR/5.test-alertmanager-sendalert/1.nginx-w-exporter/
echo "Delete alertmanager(nginx)"
kubectl delete -f $BASE_DIR/4.alertmanager/
echo "Delete kube-state-metrics"
kubectl delete -f $BASE_DIR/3.kube-state-metrics/
echo "Delete node-exporter"
kubectl delete -f $BASE_DIR/2.node-exporter/
echo "Delete prometheus-server"
kubectl delete -f $BASE_DIR/1.prometheus-server
echo "Delete namespace"
kubectl delete ns monitoring

echo "delete success all native-prometheus apps."
