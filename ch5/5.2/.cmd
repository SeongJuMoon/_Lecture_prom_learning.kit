node_memory_Active_bytes                        # gauge

node_cpu_seconds_total                          # couter 
*total                                          # couter list 

*duration_seconds                               # summary 
*length_seconds                                 # summary 
prometheus_target_interval_length_seconds       # summary 

*bucket                                         # histogram 
prometheus_http_request_duration_seconds_bucket # histogram 
# histogram sample 
histogram_quantile(0.99, rate(prometheus_http_request_duration_seconds_bucket[5m]))
