# level:metric:operations

# add node.rules on Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file node.rules.yaml

# delete node.rules on Rules menu
kubectl patch configmap prometheus-server -n monitoring --patch-file init-rules.yaml 

