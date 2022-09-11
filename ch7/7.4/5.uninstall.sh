#!/usr/bin/env bash

echo 'remove deployment and namespace'
kubectl delete -f ./sample/bookinfo
kubectl delete namespace bookinfo

echo 'delete istio all component'
istioctl x uninstall --purge
