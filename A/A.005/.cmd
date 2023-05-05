# 1. deploy node exporter.
k apply -f 1-1.node-exporter

# check node-exporter.
k apply -f 1-1.node-exporter
k get po,svc -n monitoring

# 2. deploy kube-state-metrics
k apply -f 1-2.kube-state-metrics

# 3. deploy server
k apply -f 2.prometheus-server