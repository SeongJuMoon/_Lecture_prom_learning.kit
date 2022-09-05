# input this command on prometheus web ui
container_network_receive_bytes_total

# deployed which is check by prometheus
k apply -f po-chk-hn.yaml 

# re-input after few seconds 
container_network_receive_bytes_total{pod="chk-hn"}

curl-get.sh <IP>
OR
curl-get-by-name.sh <pod name>

# check status on prom web ui 
container_network_receive_bytes_total{pod="chk-hn"}

# delete deployed pod 
k delete -f po-chk-hn.yaml 
