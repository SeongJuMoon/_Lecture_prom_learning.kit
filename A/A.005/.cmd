# 1. deploy node exporter.
k apply -f 1-1.node-exporter

# 2. check node-exporter via kubectl
k get po,svc -n monitoring -l component=node-exporter

# 3. check node-exporter can response directly.
curl http://192.168.1.10:9100/metrics # m-k8s
curl http://192.168.1.101:9100/metrics # w1-k8s
curl http://192.168.1.102:9100/metrics # w2-k8s
curl http://192.168.1.103:9100/metrics # w3-k8s

# 4. deploy kube-state-metrics
k apply -f 1-2.kube-state-metrics

# 5. check kube-state-metrics via kubectl
k get po,svc -n monitoring -l component=kube-state-metrics

# 6. deploy server
k apply -f 2.prometheus-server

# 7. check prometheus-server via kubectl
k get po,svc -n monitoring -l component=server
