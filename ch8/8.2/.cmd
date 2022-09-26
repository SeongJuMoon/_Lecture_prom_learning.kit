# 1.install kube-prometheus-stack
./1.prometheus-stack-installer-15s.sh

# 2.check resource kubernete
kubectl get pods -n monitoring
# 2-1.check pod after helm releases. (pod)
kubectl get -n monitoring pod
# 2-2.check configmap 
kubectl get -n monitoring configmap
# 2-3.check pv,vpc after helm releases.
kubectl get pv,pvc

# 3.check operator deploy as well.
kubectl get -n monitoring prometheus

# 4.check operator extends api list 
kubectl get crds | grep monitoring

# 5.get prometheus access ip
kubectl get -n monitoring service

# 6.check below promql on your browser(http://192.168.1.11/graph).
apiserver_storage_objects # apiserver metrics
node_memory_MemFree_bytes # node-exporter metric
kube_deployment_created  # kube_state-metric metric
container_processes # cadvisor metrics
kubelet_http_requests_total # kubelet metrics
kubeproxy_sync_proxy_rules_iptables_total # kubeproxy metrics
etcd_server_is_leader

# 7.check the targets status on your browser(http://192.168.1.11/targets).
4 kind of red sign which could not collect metrics properly 
It will be solved for the next session!

