# 1.change scrape interval for 1m by replace 
kubectl replace -f 1.replace-scrape-interval-1m.yaml

# 2.change scrape interval for 15s by patch 
kubectl patch -n monitoring configmap prometheus-server --patch-file 2.patch-scrape-interval-15s.yaml 

# 3.abort kube-proxy metrics collection 
./3.abort-kubeproxy-metrics.sh

# 4.register kube-proxy on prometheus configmap 
./4.register-kubeproxy-own-target.sh

-=-=-=-=-=-
# search kubeproxy metrics
https://github.com/kubernetes/kubernetes/search?l=Go&q=kubeproxy+metrics
-=-=-=-=-=-=

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
