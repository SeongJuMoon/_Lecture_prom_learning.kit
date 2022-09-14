# 0.install redis-cli for benchmark
./0.redis-cli-installer.sh 

# 1-1.deploy at a once for redis 
kubectl apply -f 1.redis-w-exporter.yaml

# check to add the target and promql a
redis_up
redis_uptime_in_seconds
redis_memory_max_bytes # 0

# 1-2.delete deployed redis 
kubectl delete -f 1.redis-w-exporter.yaml 


# 2.practical scenario
# 2-1.deploy redis only first  
kubectl apply -f 2-0.redis.yaml

# check deployed redis and svc 
# there is no redis on prometheus web ui 

# 2-2.deploy redis-exporter to scrape for deployed redis  
kubectl apply -f 2-1.redis-exporter.yaml

# 2-3.check to add the target and promql 
redis_memory_max_bytes # 83886080

# 2-5.load to redis for benchmark purpose
# -l is loops (forever) 
redis-benchmark -h 192.168.1.72 -l

# run promQL 
100 * redis_memory_used_bytes / redis_memory_max_bytes
redis_config_maxclients - redis_connected_clients
rate(redis_slowlog_length[2m])

# 2-6 delete all deployed redis&exporter 
kubectl delete -f 2-1.redis-exporter.yaml
kubectl delete -f 2-0.redis.yaml

