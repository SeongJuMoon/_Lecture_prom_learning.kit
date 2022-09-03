# check deployed app's numbers 
kube_info
count (kube_pod_info)

# check on terminal 
k get po -A | wc -l 

# check deployed apps by namespace 
count (kube_pod_info) by (namespace)

# check top 3 memory consuming app(no pod name is node's cosuming memory)
topk(3,sum(container_memory_working_set_bytes{pod!=""}/1024/1024) by (pod,image))
