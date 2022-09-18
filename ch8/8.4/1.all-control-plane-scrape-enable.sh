#!/usr/bin/env bash

kubectl get configmap -n kube-system kube-proxy -o yaml  | sed -r "s/(metricsBindAddress: ).*$/\1\"0.0.0.0:10249\"/" | kubectl replace -f -
kubectl rollout restart daemonset kube-proxy -n kube-system
sed -e "s,- --bind-address=127.0.0.1,- --bind-address=0.0.0.0," -i /etc/kubernetes/manifests/kube-controller-manager.yaml
sed -e "s,- --bind-address=127.0.0.1,- --bind-address=0.0.0.0," -i /etc/kubernetes/manifests/kube-scheduler.yaml
sed -e "s,- --listen-metrics-urls=http://127.0.0.1:2381,- --listen-metrics-urls=http://0.0.0.0:2381," -i /etc/kubernetes/manifests/etcd.yaml

echo 'etcd is rollout now'
echo 'the kubectl result will be slow or not response.'

while [ "$(crictl ps | grep etcd-m-k8s)" == "" ]
do
echo "etcd rollout in progress "
done
echo "etcd was rollout finish"
