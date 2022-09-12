# 1-1.deploy at a once for redis 
kubectl apply -f 1.redis-w-exporter.yaml

# check to add the target and promql 
redis_uptime_in_seconds
redis_memory_max_bytes # 0

# 1-2.delete deployed redis 
kubectl delete -f 1.redis-w-exporter.yaml 


# 2.actual enviroment 
# 2-1.deploy redis only 
kubectl apply -f 2-0.redis.yaml

# check deployed redis and svc 
# there is no redis on prometheus web ui 

# 2-2.deploy redis-exporter to scrape from redis  
kubectl apply -f 2-1.redis-exporter.yaml

# 2-3.check to add the target and promql 
redis_memory_max_bytes # 83886080

# 2-4.install redis-cli for benchmark
yum install -y redis

# 2-5.run awesome querys with benchmark 
redis-benchmark -h 192.168.1.72

100 * redis_memory_used_bytes / redis_memory_max_bytes
redis_config_maxclients - redis_connected_clients
rate(redis_slowlog_length[5m])

# 2-6 delete all deployed 
kubectl delete -f 2-1.redis-exporter.yaml
kubectl delete -f 2-0.redis.yaml

