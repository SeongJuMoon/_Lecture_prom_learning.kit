# check kube-state-metrics 
kubectl apply -f deploy-httpd.yaml 

# check replicas's number on web ui 
kube_deployment_status_replicas_available
kube_deployment_status_replicas_available{deployment="deploy-httpd"}

# scale out deployment 
k scale deploy deploy-httpd --replicas 6

# check replicas's number on web ui 
kube_deployment_status_replicas_available{deployment="deploy-httpd"}

# check to delete deployment 
kubectl delete -f deploy-httpd.yaml 
