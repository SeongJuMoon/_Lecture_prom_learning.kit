프로메테우스 룰을 디플로이한다.

# result 
prometheusrule.monitoring.coreos.com/container-memory-topk3 created

# topk(3,sum(container_memory_working_set_bytes{pod!=""}/1024/1024) by (pod))
# avg(rate(node_cpu_seconds_total[2m])) by (instance, mode)
