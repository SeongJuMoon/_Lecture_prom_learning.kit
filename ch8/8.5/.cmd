# 0. install redis-cli for behckmark and connect to redis.
./0.redis-cli-installer.sh

# 1. deploy redis
kubectl apply -f 1.redis.yaml

# 2. check redis deployed resource
 kubectl get service,deployment -l app=redis

# 3. deploy redis-exporter
kubectl apply -f 2.redis-exporter.yaml 

# 4. check redis-exporter deployed resource.
kubectl get service,deployment -l app=redis-exporter

# 5. configure servicemonitor to prometheus scrape redis metrics.
kubectl apply -f 3.servicemonitor-redis.yaml

# 6. using browser enter the below query on 192.168.1.11/graph 
redis_connect_clients
redis_memory_max_bytes # references on redis-manifest.

# 7. check on browser 192.168.1.11 on target menu.
# shortcut click on 192.168.1.11/targets url.
# search redis servicemonitor target 

# 8. check parameter redis deployment maxmemory.
kubectl get deployment redis -o yaml | nl
35  - args:
36  - --maxmemory 80mb
37  image: redis:7.0.4

# result
redis_connect_clients 1
redis_memory_max_bytes 83886080

# 9. generate active memory pressure to redis.
redis-benchmark -h 192.168.1.85 -l
PING_INLINE: 11419.68

# 10. enter below query on 192.168.1.11/graph after change graph tab.
# You can see that the graph values are drawn to the rightward.
redis_allocator_active_bytes # <graph>

kubectl delete -f 1.redis/
kubectl delete -f 2.redis-exporter/