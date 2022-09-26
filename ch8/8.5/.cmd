# 0. install redis-cli for behckmark and checking connection list 
./0.redis-cli-installer.sh

# 1.deploy redis
kubectl apply -f 1-1.redis.yaml

# 2.check to deploy redis resource
 kubectl get service,deployment -l app=redis

# 3.deploy redis-exporter
kubectl apply -f 1-2.redis-exporter.yaml 

# 4.check to deploy redis-exporter resource
kubectl get service,deployment -l app=redis-exporter

# 5.configure ServiceMonitor to scrape prometheus's redis metrics
kubectl apply -f 2.servicemonitor-redis.yaml

# 6.check deployed SerivceMonitor
kubectl get servicemonitors.monitoring.coreos.com -n monitoring
NAME                                                 AGE
prometheus-stack-kube-prom-apiserver                 144m
prometheus-stack-kube-prom-coredns                   144m
prometheus-stack-kube-prom-kube-controller-manager   144m
prometheus-stack-kube-prom-kube-etcd                 144m
prometheus-stack-kube-prom-kube-proxy                144m
prometheus-stack-kube-prom-kube-scheduler            144m
prometheus-stack-kube-prom-kubelet                   144m
prometheus-stack-kube-prom-operator                  144m
prometheus-stack-kube-prom-prometheus                144m
prometheus-stack-kube-state-metrics                  144m
prometheus-stack-prometheus-node-exporter            144m
redis                                                8s

# 7.check this promql on http://192.168.1.11/graph 
redis_connect_clients
redis_memory_max_bytes # references on redis-manifest.

# 8.check the targets on prometheus web UI 
# shortcut URL is 192.168.1.11/targets
# search & check the redis in the one of serviceMonitor (anyway *new*)

# 9.check maxmemory parameter in redis deployment 
kubectl get deployment redis -o yaml | nl
35  - args:
36  - --maxmemory 80mb
37  image: redis:7.0.4

# check redis parameter 
redis_connect_clients 1
redis_memory_max_bytes 83886080

# 10.generate query load for increating active memory for checking redis performance
redis-benchmark -h 192.168.1.85 -l
PING_INLINE: 11419.68

# 11.check promql on 192.168.1.11/graph 
# You can see that the graph values are drawn to the rightward. ???
redis_allocator_active_bytes # <graph>

# clear all resources for next lecture 
kubectl delete -f 1.redis/
kubectl delete -f 2.redis-exporter/
kubectl delete -f 2.servicemonitor-redis.yaml
