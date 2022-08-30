# input this command on prometheus web ui
container_network_receive_bytes_total

container_network_receive_bytes_total{pod="chk-hn"}

k apply -f po-chk-hn.yaml 

curl-get.sh <IP>
OR
curl-get-by-name.sh <pod name>

# check status on prom web ui 
container_network_receive_bytes_total{pod="chk-hn"}

