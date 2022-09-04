# apply nginx directory 
kubectl apply -f nginx-w-exporter 

# check application's metrics on web ui
nginx_up
nginx_http_requests_total

# delete deployed nginx 
kubectl delete -f nginx-w-exporter 
