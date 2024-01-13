#!/usr/bin/env bash

BASE_DIR="$HOME/_Lecture_prom_learning.kit/A/A.006"

echo "Delete prometheus-alert-rule"
kubectl delete -f $BASE_DIR/7.prometheus-alert-rule.yaml
echo "Delete alertmanager"
kubectl delete -f $BASE_DIR/6.alertmanager/
echo "Delete kube-state-metrics"
kubectl delete -f $BASE_DIR/5.kube-state-metrics/
echo "Delete node-exporter"
kubectl delete -f $BASE_DIR/4.node-exporter/
echo "Delete prometheus-server exporter config"
kubectl delete -f $BASE_DIR/3.exporter-non-prom-ecosystem/
echo "Delete prometheus-server"
kubectl delete -f $BASE_DIR/2.prometheus-server
echo "Delete prometheus-operator"
kubectl delete -f $BASE_DIR/1-4.prometheus-server
echo "Delete prometheus-webhook-configuration"
kubectl delete -f $BASE_DIR/1-3.operator-webhook-configuration
echo "Delete operator-admission-controller"
kubectl delete -f $BASE_DIR/1-2.operator-admission-controller
echo "Delete prometheus-webhook-configuration"
kubectl delete -f $BASE_DIR/1-1.operator-crd
echo "Delete namespace"
kubectl delete ns monitoring

echo "delete success all prometheus-stack apps."
