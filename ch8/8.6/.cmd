# 1.check metallb pod
kubectl get pods -n metallb-system -o wide

# 2.find metrics port information which assign already on metallb components 
# it looks like 'not enough'
# so kubectl get edit or other need to clarify port name mapping
./1.grep-metallb-ports.sh

# 3.configure podmonitor to scrape metallb metrics 
kubectl apply -f 2.podmonitor-metallb.yaml

# 4.get podmonitor which is deployed 
kubectl get podmonitor -n monitoring

# 5.check deployed podmonitor on the targets of prometheus web UI
# shortcut click on 192.168.1.11/targets url.
# search metallb podmonitor target 

# 6.check promql on prometheus web UI
# shortcut http://192.168.1.10/graph
metallb_speaker_announced
metallb_allocator_addresses_total - metallb_allocator_addresses_in_use_total

# 7.cleaning resources 
kubectl delete -f 2.podmonitor-metallb.yaml

