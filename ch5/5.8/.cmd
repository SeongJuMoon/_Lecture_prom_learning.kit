# check function on web ui
rate 
abs
histogram_quantile

# couter 
rate(node_cpu_seconds_total[5m])
rate(node_cpu_seconds_total{node="m-k8s",mode="system"}[5m])

# check graph on web ui 

# add avg operator 
avg(rate(node_cpu_seconds_total{node="m-k8s",mode="system"}[5m]))


# change function from rate to irate 
avg(irate(node_cpu_seconds_total{node="m-k8s",mode="system"}[5m]))

# draw `trend line` 
predict_linear(node_memory_Active_bytes[5m],60*60*2)/1024/1024

