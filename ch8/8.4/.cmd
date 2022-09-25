# deploy nginx with exporter to collect metrics from nginx to prometheus operator 
kubectl apply -f 0.nginx-w-exporter 

# deploy nginx for explain monitoring

# check nginx resources.
kubectl get deployment nginx
kubectl get service nginx

# check nginx service exposed prometheus metric via curl
curl http://192.168.1.84:9113/metrics

# check promql below prometheus web ui(https://192.168.1.11/graph).
nginx_up

# configure ServiceMonitor which is the operator of prometheus
kubectl apply -f 1.servicemonitor-nginx.yaml

# check again promql below prometheus web ui(https://192.168.1.11/graph).
nginx_up

# nginx deploy scale up to check scraping working flexiable
kubectl scale deployment nginx --replicas=3

# check again promql below prometheus web ui(https://192.168.1.11/graph).
nginx_up

# check how servicemonitor scraping track modified.
kubectl get service nginx
kubectl get endpoints nginx 
kubectl get endpoints nginx -o yaml

# remove nginx resources and servicemonitor
kubectl delete -f 0.nginx-w-exporter/
kubectl delete -f 1.servicemonitor-nginx.yaml