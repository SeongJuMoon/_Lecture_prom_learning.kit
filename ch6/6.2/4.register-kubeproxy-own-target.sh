#!/usr/bin/env bash

# register new kube-proxy job for prometheus  
kubectl patch -n monitoring configmap prometheus-server --patch-file ~/_Lecture_prom_learning.kit/ch6/6.2/promethues-kubeproxy-job/enabled-15s.yaml 

echo "successfully register new job for kubeproxy!"
