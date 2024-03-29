# apply CRD to create rules 
kubectl apply -f 1.PrometheusRule-node-memory-usage.yaml

# delete rules so that move next step
kubectl delete -f 1.PrometheusRule-node-memory-usage.yaml

# result 
prometheusrule.monitoring.coreos.com/container-memory-topk3 created

# topk(3,sum(container_memory_working_set_bytes{pod!=""}/1024/1024) by (pod))
# avg(rate(node_cpu_seconds_total[2m])) by (instance, mode)

# create rules by operator's configuration
./2.prometheus-stack-upgrader-15s.sh

