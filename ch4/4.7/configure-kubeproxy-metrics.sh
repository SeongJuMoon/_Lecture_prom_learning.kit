#!/usr/bin/env bash

# update configmap by replace option 
kubectl get configmap -n kube-system kube-proxy -o yaml  | sed -r "s/(metricsBindAddress: ).*$/\1\"0.0.0.0:10249\"/" | kubectl replace -f -

# restart daemonset for applying modified configmap  
kubectl rollout restart daemonset -n kube-system kube-proxy

# add scrape information for collecting kkube-proxy metrics 
kubectl patch -n monitoring configmap prometheus-server --patch-file kubeproxy-scrape/enabled-15s.yaml

echo "successfully configure the metrics and scrape for kubeproxy!"