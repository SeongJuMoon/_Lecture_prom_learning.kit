#!/usr/bin/env bash

# update config 
kubectl get configmap -n kube-system kube-proxy -o yaml  | sed -r "s/(metricsBindAddress: ).*$/\1\"0.0.0.0:10249\"/" | kubectl replace -f -

# restart daemonset for update config
kubectl rollout restart daemonset -n kube-system kube-proxy

# add scrape config to scrape kube-proxy metrics with replace update
kubectl replace -f ~/_Lecture_prom_learning.kit/ch4/4.7/kube-proxy-scrape-update.yaml
