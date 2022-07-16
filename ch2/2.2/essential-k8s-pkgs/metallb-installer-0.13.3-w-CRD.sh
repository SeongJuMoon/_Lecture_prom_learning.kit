#!/usr/bin/env bash

# deploy MetalLB v0.13.3
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.3/config/manifests/metallb-native.yaml

# install CRD which is instaed of CM for metalLB ip CIDR
cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: k8s-svc-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.1.11-192.168.1.49
EOF
