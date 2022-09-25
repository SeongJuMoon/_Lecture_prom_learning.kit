tree

# 1. if as you not uninstall prometheus. execute below shell

./1.prometheus-uninstaller.sh

# 1-2. check pv,pvc was deleted.
kubectl get pv,pvc

# 2. install kube-prometheus-stack
./2.prometheus-stack-installer-15s.sh

# 3. check resource kubernete
kubectl get pods -n monitoring
# 3-1. check pod after helm releases. (pod)
kubectl get -n monitoring pod
# 3-2. check configmap 
kubectl get -n monitoring configmap
# 3-3. check pv,vpc after helm releases.
kubectl get pv,pvc

# 4. check operator deploy as well.
kubectl get -n monitoring prometheus

# 5. check operator extends api list 
kubectl get crds | grep monitoring

# 6. get prometheus access ip
kubectl get -n monitoring service

# check below promql on your browser(http://192.168.1.11/graph).
apiserver_storage_objects # apiserver metrics
node_memory_MemFree_bytes # node-exporter metric
kube_deployment_created  # kube_state-metric metric
container_processes # cadvisor metrics
kubelet_http_requests_total # kubelet metrics
kubeproxy_sync_proxy_rules_iptables_total # kubeproxy metrics
etcd_server_is_leader

# check below promql on your browser(http://192.168.1.11/targets).
we meet scrape error.
next leture we resolved scrape error!

