# apply CRD to create rules 
kubectl apply -f 1.PrometheusRule-node-memory-usage.yaml

# delete rules so that move next step
kubectl delete -f 1.PrometheusRule-node-memory-usage.yaml

# create rules by operator's configuration
./2.prometheus-stack-upgrader-15s.sh

