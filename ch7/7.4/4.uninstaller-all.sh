#!/usr/bin/env bash

echo 'remove deployment and namespace'
kubectl delete -f ./istio/samples/bookinfo
kubectl delete -f ./istio/samples/addon
kubectl delete namespace bookinfo

echo 'delete istio all component'
istioctl x uninstall --purge -y
