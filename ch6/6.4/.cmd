# level:metric:operations

# add container rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-4-container.yaml
# check rules and PromQL on prometheus web ui 
container:memory_working_set:topk3

# add node rule at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file prometheus-recording.rules-add-node.yaml
# check rules and PromQL on prometheus web ui 
node:node_memory:usage

# delete all recording rules at Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file init-rules.yaml 

# if you want to init recording rules 
# run this 
# kubectl patch configmap prometheus-server -n monitoring --patch-file init-recording.rules.yaml
