#!/usr/bin/env bash

# deploy metrics-server v0.6.1
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.1/components.yaml
