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

# 2.add annotations on kube-proxy daemonset 
kubectl edit daemonset -n kube-system kube-proxy  
```
spec:
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      k8s-app: kube-proxy
  template:
    metadata:
      annotations:
        prometheus.io/port: "10249"      <<<
        prometheus.io/scrape: "true"     <<<
      creationTimestamp: null
      labels:
        k8s-app: kube-proxy
    spec:
      containers:
      - command:
        - /usr/local/bin/kube-proxy
        - --config=/var/lib/kube-proxy/config.conf
        - --hostname-override=$(NODE_NAME)
```


# check 'kubeproxy_sync_proxy_rules_iptables_total' on web ui

