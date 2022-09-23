#!/usr/bin/env bash

# check istioctl is installed.
if (command -v istioctl > /dev/null); then
  echo "istioctl installed already."
else
  source ~/_Lecture_prom_learning.kit/ch9/9.3/istio/install.sh
fi

echo "Begin to install for istio components"
echo "====================================="
istioctl install --set profile=demo -y

kubectl create namespace bookinfo
kubectl label namespace bookinfo istio-injection=enabled
kubectl apply -f ~/_Lecture_prom_learning.kit/ch9/9.3/istio/samples/bookinfo
kubectl apply -f ~/_Lecture_prom_learning.kit/ch9/9.3/istio/samples/addon
echo "========================================"
echo "istio's dashboard(kiali) is deploying.."
echo "kiali graph URL is http://192.168.1.93:20001/kiali/console/graph/"
# load-generator for drawing graph on kiali
./istio/load-generator-10s.sh > /dev/null 2>&1 &
