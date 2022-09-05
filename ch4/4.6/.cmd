# 1.Check Status and Config
# check metallb allocated address on web ui 
metallb_allocator_addresses_in_use_total

# To check 'prometheus.io/scrape', 'prometheus.io/port' for collecting metrics info from metallb's controller & speaker 
kubectl get pods -n metallb-system -o yaml | grep annotation -A 6

# ConfigMap have target point to collect metrics info 
kubectl get cm prometheus-server -n monitoring -o yaml | grep -A 30 kubernetes-pods

# 2.Deploy new loadbalancer and Check Status 
# deploy new deploy & svc for increasing lb allocated address
kubectl apply -f deploy-svc-chk-hn.yaml
kubectl get po,svc 

# check metallb allocated address on web ui 
metallb_allocator_addresses_in_use_total

# delete deployed deploy-svc 
kubectl delete -f deploy-svc-chk-hn.yaml

