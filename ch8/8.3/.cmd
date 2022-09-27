# 1.check static pods in m-k8s
ls -rlth /etc/kubernetes/manifests/

# control plane without etcd 
# 2.to config for scraping all control plane
./1.scraping-control-plane-enabled.sh

# 3.check control plane metrics exposed 
curl http://192.168.1.10:2381/metrics # etcd
curl http://192.168.1.10:10249/metrics # kube-proxy

# 3.check targets which is registered properly on targets menu (http://192.168.1.10/targets)
# kubelet
sum(rate(kubelet_runtime_operations_total[2m])) by (operation_type)

# schduler
rate(scheduler_schedule_attempts_total[2m])

# kube-proxy
sum(kubeproxy_sync_proxy_rules_iptables_total) by (table, pod)

# etcd part 
# 4.update etcd service port due to secure port is already bound 
#   but it is very complext to configure out. 
#   so we will change insecure port to collect metrics from etcd 
./2.prometheus-stack-upgrader-15s.sh

# 5.check promql on your browser so that confirm to collect metrics properly
# etcd
etcd_server_is_leader
histogram_quantile(0.99, rate(etcd_disk_backend_commit_duration_seconds_bucket[2m]))

