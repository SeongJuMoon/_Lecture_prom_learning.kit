#!/usr/bin/env bash

echo "Start to delete istio components"
echo "============================="
kubectl delete -f ./istio/samples/bookinfo
kubectl delete -f ./istio/samples/addon
kubectl delete namespace bookinfo

istioctl x uninstall --purge -y
echo "============================="
echo "Successfully deleted istio all components"

# kill load-generator-10s.sh 
kill -9 `ps aux | grep load-gen | awk '{print $2}'` > /dev/null 2>&1
