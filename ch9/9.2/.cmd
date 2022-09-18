# 0. install redis-cli for benchmark
yum install -y redis

# 1. deploy redis for start lab
kubectl apply -f 1.redis/

# 2. check subdirectory item 
ls -rlt 1.redis/

# 3. check redis deployment.
# redis service, redis-deployment applied. 
kubectl get deployment,svc redis

# 4. check parameter redis deployment maxmemory.
kubectl get deployment redis -o yaml | nl
35  - args:
36  - --maxmemory 80mb
37  image: redis:7.0.4

# 5. deploy redis-exporter for scrape redis metrics.
kubectl apply -f 2.redis-exporter/

# 6. check subdirectory (redis-exporter) which applied before steps.
# redis service, redis-deployment applied. 
ls -rlt 2.redis-exporter/

# 7. check redis-exporter deployment.
kubectl get deployment,svc redis-exporter

# 8. how prometheus does scrape metrics?
# checkout redis-exporter service yaml status.

kubectl get service redis-exporter -o yaml | nl

# you've seen annotations below. 
that means the annotations properties generate target exporter address for redis metrics
 when prometheus service discovery.
---   
7  prometheus.io/port: "9121"
8  prometheus.io/scrape: "true"
---

# 9. check on browser 192.168.1.11 on target menu.
# shortcut click on 192.168.1.11/targets url.
# find redis-exporter kubernetes-service-endpoints job.

# 10. using browser enter the below query on 192.168.1.11/graph 
redis_connect_clients
redis_memory_max_bytes # references on redis-manifest.

# 11. check parameter redis deployment maxmemory.
kubectl get deployment redis -o yaml | nl
35  - args:
36  - --maxmemory 80mb
37  image: redis:7.0.4

# result
redis_connect_clients 1
redis_memory_max_bytes 83886080

# 12. connect to redis for increase connected_client metrics.
redis-cli -h 192.168.1.72

# 13. retry enter below query on 192.168.1.11/graph 
redis_connect_clients 
# result 
redis_connect_clients  2

# 14. generate active memory pressure to redis.
redis-benchmark -h 192.168.1.72
PING_INLINE: 11419.68

# enter below query on 192.168.1.11/graph after change graph tab.
# You can see that the graph values are drawn to the rightward.
redis_allocator_active_bytes # <graph>

# 15. release trigger redis_benchmark for next step.
CTRL+C

# 16. remove redis and redis-exporter
kubectl delete -f 1.redis/
kubectl delete -f 2.redis-exporter/