# 1. check metallb pod
kubectl get pods -n metallb-system -o wide

# 2. find metrics port information by pre defined shell.
./1.search-pod-monitorport.sh

# 3. configure podmonitor to prometheus scrape metallb metric.
kubectl apply -f 2.podmonitor-metallb.yaml

# 4. search podmonitor at monitoring
kubectl get podmonitor -n monitoring

# 5. check on browser 192.168.1.11 on target menu.
# shortcut click on 192.168.1.11/targets url.
# search metallb podmonitor target 

# 6. check blow promql using browser prometheus ui.
# shortcut http://192.168.1.10/graph
metallb_speaker_announced
metallb_allocator_addresses_total - metallb_allocator_addresses_in_use_total
