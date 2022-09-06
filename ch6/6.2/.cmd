# change scrape interval for 1m by replace 
kubectl replace -f replace-scrape-interval-1m.yaml

# change scrape interval for 15s by patch 
kubectl patch -n monitoring configmap prometheus-server --patch-file patch-scrape-interval-15s.yaml 

