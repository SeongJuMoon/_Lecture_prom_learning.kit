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
sum(kubelet_http_requests_total) without (job)
sum(kubelet_http_requests_total) without (job,instance,kubernetes_io_arch)

up
sum(up{job="kubernetes-service-endpoints"}) 
without(app,app_kubernetes_io_managed_by,chart,component,heritage,k8s_app,kubernetes_io_cluster_service,app_kubernetes_io_component,app_kubernetes_io_instance,app_kubernetes_io_name,app_kubernetes_io_part_of,app_kubernetes_io_version,helm_sh_chart)

