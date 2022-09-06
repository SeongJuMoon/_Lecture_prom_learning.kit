# Aggregation operators
node_cpu_seconds_total
topk(3,node_cpu_seconds_total)
bottomk(3,node_cpu_seconds_total) 
bottomk(3,node_cpu_seconds_total > 0) 

# Aggregation operators by 
node_cpu_seconds_total
avg(node_cpu_seconds_total)
avg(node_cpu_seconds_total{mode="user"})
avg(node_cpu_seconds_total{mode="user"}) by (node)

# Aggregation operators without
kubelet_http_requests_total
sum(kubelet_http_requests_total) without(path)
sum(kubelet_http_requests_total) without(path,service)

