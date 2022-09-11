#!/usr/bin/env bash

# check istioctl is installed.
if (command -v istioctl > /dev/null); then
  echo 
else
  echo 'install istioctl'
  source ~/_Lecture_prom_learning.kit/ch7/7.4/install-istio.sh
fi

echo 'istio install'
istioctl install --set profile=demo -y

echo 'prepare sample application deploy targeted namespace'
kubectl create namespace bookinfo

echo 'process add labeling istio sidecar injection enabled'
kubectl label namespace bookinfo istio-injection=enabled

echo 'deploy sample application bookinfo at bookinfo namespace'
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/bookinfo

echo 'deploy addon visualized tool.'
echo 'prometheus, kiali will be deploy.'
echo 'kiali url is http://192.168.1.20:20001'
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/samples/addon