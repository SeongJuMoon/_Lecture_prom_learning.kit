# check deployed app's numbers 
kube_info
count (kube_pod_info)

# check on terminal 
k get po -A | wc -l 

# check deployed apps by namespace 
count (kube_pod_info) by (namespace)

