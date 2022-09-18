#!/usr/bin/env bash

echo "Exit Process Enter [CTRL + C]"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
while true; do curl -s -o /dev/null "http://$INGRESS_HOST/productpage"; done