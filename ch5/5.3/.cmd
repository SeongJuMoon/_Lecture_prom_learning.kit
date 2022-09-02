node_memory_Active_bytes

node_memory_Active_bytes{node="m-k8s"}

node_memory_Active_bytes{node!="m-k8s"}

node_memory_Active_bytes{node=~"w.+"}
node_memory_Active_bytes{node=~"w.*"}
node_memory_Active_bytes{node=~"m-k8s|w1-k8s"}

# multi label matcher  
node_cpu_seconds_total{node=~"w.*",mode="user"}
