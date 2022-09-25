# 1. check static pods in m-k8s
ls -rlth /etc/kubernetes/manifests/

# 2. run fixd shell, to scrape all control plane
./1.scraping-control-plane-enabled.sh

# 3. check control plane metrics expose now.
curl http://192.168.1.10:2381/metrics # etcd
curl http://192.168.1.10:10249/metrics # kube-proxy

# 3. check target register on web page(http://192.168.1.10/targets)

# 4. update etcd service port, for scrape metrics data from metrics-port
./2.prometheus-stack-upgrader-15s.sh

# 5. check below promql on your browser(http://192.168.1.11/graph).
# etcd
etcd_server_is_leader
histogram_quantile(0.99, rate(etcd_disk_backend_commit_duration_seconds_bucket[2m]))

# kubelet
sum(rate(kubelet_runtime_operations_total[2m])) by (operation_type)

# schduler
rate(scheduler_schedule_attempts_total[2m])

# kube-proxy
sum(kubeproxy_sync_proxy_rules_iptables_total) by (table, pod)