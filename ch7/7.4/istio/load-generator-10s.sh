#!/usr/bin/env bash
# kiali draw graph per 15sec as default
# thus 10sec is reasonable choice 

echo "Exit Process Enter [CTRL + C]"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
while true; do curl -s -o /dev/null "http://$INGRESS_HOST/productpage";sleep 10; done
