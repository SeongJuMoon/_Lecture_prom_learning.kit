#!/usr/bin/env bash

# update config 
kubectl get configmap -n kube-system kube-proxy -o yaml  | sed -r "s#^(metricsBindAddress: ).*#\10.0.0.0:10249#" | kubectl replace -f -
# restart
kubectl rollout restart daemonset n kube-system kube-proxy
#