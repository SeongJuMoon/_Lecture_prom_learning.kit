# level:metric:operations

# add node.rules on Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file node.rules.yaml
# check rules and PromQL on prometheus web ui 
node:node_memory:usage

# delete node.rules on Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file init-rules.yaml 

