# 1./sys
# check cgroup status 
  ll /sys/fs/cgroup
  https://www.slideshare.net/JoHoon1/systemd-cgroup

# 2./proc
  cat /proc/version
  cat /proc/cpuinfo
  cat /proc/meminfo 

# 3.node exporter  
# memory load on w3-k8s > approx 50M consumed 
stress --vm 5 --vm-bytes 10M --timeout 150s

# check node memory 
node_memory_Active_bytes
node_memory_Active_bytes{node="w3-k8s"}

# cpu load on w3-k8s
stress --cpu 2 --timeout 300s

# check node cpu
node_cpu_seconds_total
node_cpu_seconds_total{node="w3-k8s"}g
node_cpu_seconds_total{node="w3-k8s", mode="user"}

