#!/usr/bin/env bash

kubectl get configmap -n kube-system kube-proxy -o yaml  | sed -r "s#^(metricsBindAddress: ).*#\10.0.0.0:10249#" | kubectl replace -f -
