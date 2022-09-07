#!/usr/bin/env bash
 
# delete annotations for aborting colletion metrics by kubernetes-pod 
kubectl patch daemonset -n kube-system kube-proxy --patch-file kubeproxy-template-annotations/disabled.yaml 

echo "successfully abort the metrics and scrape for kubeproxy!"
