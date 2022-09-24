# deploy nginx with exporter to collect metrics from nginx to prometheus operator 
kubectl apply -f 1.nginx-w-exporter 


# deploy nginx for explain monitoring


# check nginx resources.
kubectl get deployment nginx
kubectl get service nginx

# check nginx service exposed prometheus metric via curl
curl http://192.168.1.83/metrics

# configure ServiceMonitor which is the operator of prometheus
kubectl apply -f 2.serviceMonitor.yaml 
