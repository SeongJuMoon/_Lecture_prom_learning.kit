# deploy nginx with exporter to collect metrics from nginx to prometheus operator 
kubectl apply -f 0.nginx-w-exporter 

# check deployed nginx resources.
kubectl get deploy,svc 

# check nginx metric to expose by prometheus 
curl http://192.168.1.84:9113/metrics

# check below promql on prometheus web ui(https://192.168.1.11/graph).
nginx_up

# configure ServiceMonitor which is the operator of prometheus
kubectl apply -f 1.servicemonitor-nginx.yaml

# check again promql on prometheus web ui(https://192.168.1.11/graph).
nginx_up

# nginx deployment scale up to check so that scrape is working properly 
kubectl scale deployment nginx --replicas=3

# check again promql on prometheus web ui(https://192.168.1.11/graph).
nginx_up

# check how servicemonitor scraping ???
kubectl get service nginx
kubectl get endpoints nginx 
kubectl get endpoints nginx -o yaml

# delete nginx resources and servicemonitor
kubectl delete -f 0.nginx-w-exporter/
kubectl delete -f 1.servicemonitor-nginx.yaml
