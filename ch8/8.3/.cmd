# deploy nginx with exporter to collect metrics from nginx to prometheus operator 
kubectl apply -f nginx-w-exporter 

# configure ServiceMonitor which is the operator of prometheus
kubectl apply -f ServiceMonitor.yaml 
