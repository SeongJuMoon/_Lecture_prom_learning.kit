# memory load : approx 50M consumed 
stress --vm 5 --vm-bytes 10M --timeout 60s

# check node memory 
node_memory_Active_bytes
node_memory_Active_bytes{instance="192.168.1.10:9100"}

# cpu load 
stress --cpu 2  --timeout 300s

# check node cpu
node_cpu_seconds_total
node_cpu_seconds_total{instance="192.168.1.10:9100"}
node_cpu_seconds_total{instance="192.168.1.10:9100", mode="user"}

