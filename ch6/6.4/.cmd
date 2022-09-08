# level:metric:operations

# add container rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-4-container.yaml
# check rules and PromQL on prometheus web ui 
container:memory:topk3

# add node rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-add-node.yaml
# check rules and PromQL on prometheus web ui 
node:node_memory:usage

# delete node.rules on Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file init-rules.yaml 

