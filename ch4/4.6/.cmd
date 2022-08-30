# apply nginx directory 
kubectl apply -f nginx-w-exporter 

# check application's metrics on web ui
nginx_up
nginx_connections_accepted

# delete deployed nginx 
kubectl delete -f nginx-w-exporter 
