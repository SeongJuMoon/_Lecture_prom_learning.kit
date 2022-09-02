# Aggregation operators by 
node_cpu_seconds_total
avg(node_cpu_seconds_total)
avg(node_cpu_seconds_total{mode="user"})
avg(node_cpu_seconds_total{mode="user"}) by (node)

# Aggregation operators without
kubelet_http_requests_total
sum(kubelet_http_requests_total) without (job)
sum(kubelet_http_requests_total) without (job,instance,kubernetes_io_arch)

