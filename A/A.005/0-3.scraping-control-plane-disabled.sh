#!/usr/bin/env bash

# restore back all #

# metricsBindAddress for kube-proxy 
echo "Unconfigure metrics-binder for kube-proxy"
kubectl get configmap -n kube-system kube-proxy -o yaml       \
  | sed -r "s/(metricsBindAddress: ).*$/\1\"\"/" \
  | kubectl replace -f - \
  > /dev/null 2>&1
kubectl rollout restart daemonset kube-proxy -n kube-system \
  > /dev/null 2>&1

# bind-address for kube-controller-manager's metrics 
echo "Unconfigure metrics-binder for kube-controller-manager"
sed s,"- --bind-address=0.0.0.0","- --bind-address=127.0.0.1",g \
    -i /etc/kubernetes/manifests/kube-controller-manager.yaml
# bind-address for kube-scheduler's metrics 
echo "Unconfigure metrics-binder for kube-scheduler"
sed s,"- --bind-address=0.0.0.0","- --bind-address=127.0.0.1",g \
    -i /etc/kubernetes/manifests/kube-scheduler.yaml
# bind-address for etcd's metrics 
echo "Unconfigure metrics-binder for etcd"
sed s,"- --listen-metrics-urls=http://0.0.0.0:2381","- --listen-metrics-urls=http://127.0.0.1:2381",g \
    -i /etc/kubernetes/manifests/etcd.yaml
echo "===================================================="
echo "Wait for rolling out the control plane in few Seconds"; sleep 5 
while [ -z "$(crictl ps | grep etcd | grep Running)" ]
do
  echo "control plane is rolling out in progress..."
  sleep 3
done
  echo "control plane rolled out successfully!"
