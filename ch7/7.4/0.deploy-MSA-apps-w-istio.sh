#!/usr/bin/env bash

# check istioctl is installed.
if (command -v istioctl > /dev/null); then
  echo 'istioctl installed already.'
else
  echo 'install istioctl'
  source ~/_Lecture_prom_learning.kit/ch7/7.4/istio/install.sh
fi

echo 'begin to install for istio'
echo '=========================='
istioctl install --set profile=demo -y

kubectl create namespace bookinfo
kubectl label namespace bookinfo istio-injection=enabled
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/istio/samples/bookinfo
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/istio/samples/addon
echo "========================================"
echo "istio's dashboard(kiali) is deploying.."
echo "kiali grpah URL is http://192.168.1.20:20001/kiali/console/graph/"

