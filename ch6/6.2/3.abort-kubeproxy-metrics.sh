#!/usr/bin/env bash
 
# delete annotations for aborting colletion metrics by kubernetes-pod 
kubectl patch -n monitoring configmap prometheus-server --patch-file kubeproxy-template-annotations/disabled.yaml 

echo "successfully abort the metrics and scrape for kubeproxy!"
