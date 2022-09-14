#!/usr/bin/env bash

echo "Start to delete istio components"
echo "============================="
kubectl delete -f ./istio/samples/bookinfo
kubectl delete -f ./istio/samples/addon
kubectl delete namespace bookinfo

istioctl x uninstall --purge -y
echo "============================"
echo "successfully eleted istio all components"

# kill load-generator-10s.sh 
kill -9 `ps aux | grep load-generator | awk '{print $2}'`
