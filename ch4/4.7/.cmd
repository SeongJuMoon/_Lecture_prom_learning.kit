# 1.get raw metrics 
# get all of raw information 
kubectl get --raw / 

# get version from raw 
kubectl get --raw /version 

# get mertics from raw 
kubectl get --raw /metrics 

# get api object status from raw 
kubectl get --raw /metrics | grep apiserver_storage_objects 
kubectl get --raw /metrics | grep apiserver_storage_objects | wc -l # output: 80(# TYPE,HELP)

# check api object status from web ui 
apiserver_storage_objects # output: 78 

# 2.config kubeproxy metrics to collect it 
# kubeproxy 
