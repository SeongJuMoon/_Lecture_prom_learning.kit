# Arithmetic binary operators
node_memory_Active_bytes
node_memory_Active_bytes/1024/1024

# Comparison binary operators
kube_pod_container_status_restarts_total > 3

# Logical/set binary operators 
kube_pod_container_status_terminated > 0 or kube_pod_container_status_waiting > 0
k run wait --image=wait
kube_pod_container_status_terminated > 0 or kube_pod_container_status_waiting > 0

