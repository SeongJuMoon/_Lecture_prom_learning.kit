# search kubeproxy metrics 
https://github.com/kubernetes/kubernetes/search?l=Go&q=kubeproxy+metrics 



# scripts automatically for collect metrics and expose it
# configure-kubeproxy-metrics.sh

# manually like below (if you want)
# 1.Configonfigure to expose kube-proxy's metrics from w3-k8s's Pod
kubectl edit cm kube-proxy -n kube-system
  metricsBindAddress: "" >> metricsBindAddress: "0.0.0.0:10249"
kubectl rollout restart daemonset kube-proxy  -n kube-system  

# 2.register prometheus service discovery
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


# check 'kubeproxy_sync_proxy_rules_iptables_total' on web ui

