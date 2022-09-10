# level:metric:operations

# add container rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-container-memory-topk3.yaml
# check rules and PromQL on prometheus web ui 
container:memory_working_set:topk3

# add node rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-node-memory-usage.yaml
# check rules and PromQL on prometheus web ui 
node:node_memory:usage

# delete all recording rules at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file init-recording.rules.yaml 
