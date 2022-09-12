#!/usr/bin/env bash

# register new kube-proxy job for prometheus  
kubectl patch -n monitoring configmap prometheus-server --patch-file promethues-kubeproxy-job/enabled-15s.yaml 

echo "successfully register new job for kubeproxy!"
