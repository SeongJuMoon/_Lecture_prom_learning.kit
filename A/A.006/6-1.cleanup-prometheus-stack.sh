#!/usr/bin/env bash

BASE_DIR="$HOME/_Lecture_prom_learning.kit/A/A.006"

echo "Delete recoding rule."
kubectl delete -f $BASE_DIR/5.prometheus-recording-rule.yaml

echo "Delete kube-state-metrics servicemonitor."
kubectl delete -f $BASE_DIR/4-4.kube-state-metrics-servicemonitor.yaml

echo "Delete kube-state-metrics."
kubectl delete -f $BASE_DIR/4-3.kube-state-metrics.yaml

echo "Delete kube-node-exporter servicemonitor."
kubectl delete -f $BASE_DIR/4-2.node-exporter-servicemonitor.yaml

echo "Delete node-exporter."
kubectl delete -f $BASE_DIR/4-1.node-exporter.yaml

echo "Delete control-plane servicemonitor and disable scrape control-plane metrics."
kubectl delete -f $BASE_DIR/3-1.control-plane -R
source $BASE_DIR/6-2.scraping-control-plane-disabled.sh

echo "Delete prometheus server servicemonitor."
kubectl delete -f $BASE_DIR/2-2.prometheus-servicemonitor.yaml

echo "Delete prometheus server."
kubectl delete -f $BASE_DIR/2-1.prometheus-server.yaml

echo "Delete prometheus-operator"
kubectl delete -f $BASE_DIR/1-3.prometheus-operator.yaml

echo "Delete prometheus-operator-admission-controller"
kubectl delete -f $BASE_DIR/1-2.prometheus-operator-admission-controller.yaml

echo "Delete prometheus-operator-crd"
kubectl delete -f $BASE_DIR/1-1.prometheus-operator-crd/

echo "Delete success all prometheus-stack apps."
