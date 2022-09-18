#!/usr/bin/env bash

echo 'remove deployment and namespace'
kubectl delete -f ./samples/bookinfo
kubectl delete -f ./samples/addon
kubectl delete namespace bookinfo

echo 'delete istio all component'
istioctl x uninstall --purge -y
