# 1.get raw metrics 
# get all of raw information 
kubectl get --raw / 

# get version from raw 
kubectl get --raw /version 

# get mertics from raw 
kubectl get --raw /metrics 

# get api object status from raw 
kubectl get --raw /metrics | grep apiserver_storage_objects 
kubectl get --raw /metrics | grep apiserver_storage_objects | wc -l # output: 80(# TYPE,HELP)

# check api object status from web ui 
apiserver_storage_objects # output: 78 

# 2.config kubeproxy metrics to collect it 
# kubeproxy 

# already implement proxy's metrics 
https://github.com/kubernetes/kubernetes/blob/v1.24.3/pkg/proxy/metrics/metrics.go

# 2-1-1.metrics exposed this type for 'sync_proxy_rules_iptables_total'
https://github.com/kubernetes/kubernetes/blob/v1.24.3/pkg/proxy/metrics/metrics.go#L138-L150

# 2-1-2.metrics registered for 'IptablesRulesTotal'
https://github.com/kubernetes/kubernetes/blob/v1.24.3/pkg/proxy/metrics/metrics.go#L178

# 2-1-3.transform: add labels to metrics and set gauge value 
https://github.com/kubernetes/kubernetes/blob/v1.24.3/pkg/proxy/iptables/proxier.go#L1450-L1451

# how to check or follow up code?
https://github.com/kubernetes/kubernetes/search?q=IptablesRulesTotal

# 2-2.1 ????

# 2-2-1 ~/_Lecture_prom_learning.kit/ch4/4.7/setup-metrics-kube-proxy.sh (setup metrics with prometheus)

# 2-2-1.Configonfigure to expose kube-proxy's metrics from w3-k8s's Pod  (outdated)
kubectl edit cm kube-proxy -n kube-system
  metricsBindAddress: "" >> metricsBindAddress: "0.0.0.0:10249"
kubectl rollout restart daemonset kube-proxy  -n kube-system  

# 2-3-1.register prometheus service discovery (outdated)
kubectl edit cm -n monitoring prometheus-server
```
    - job_name: kube-proxy
      honor_labels: true
      kubernetes_sd_configs:
      - role: pod
      relabel_configs:
      - action: keep
        source_labels:
        - __meta_kubernetes_namespace
        - __meta_kubernetes_pod_name
        separator: '/'
        regex: 'kube-system/kube-proxy.+'
      - source_labels:
        - __address__
        action: replace
        target_label: __address__
        regex: (.+?)(\\:\\d+)?
        replacement: $1:10249
```


# 2-4-1.check 'kubeproxy_sync_proxy_rules_iptables_total' on web ui

