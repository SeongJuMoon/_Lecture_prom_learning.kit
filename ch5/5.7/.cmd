# offset Modifier
node_memory_Active_bytes offset 1m
node_memory_Active_bytes offset 1h

# '@' Modifier
# get current unix time 
date +%s
node_memory_Active_bytes @<uninx_time> 
