# check promehteus ui graph, enter the below query.
node_uname_info

# check current scrape config via kubectl edit 
k -n monitoring edit cm prometheus-server
/start
action keep, drop check
action replace check
action label drop check

# add patch for drop label heritage
./1.add-drop-label-patch.sh

# check prometheus ui graph, enter the below query.
node_uname_info 
node_procs_running
kube_configmap_info 

# check label invisible
node_uname_info offset 10m
node_procs_running offset 10m
kube_configmap_info offset 10m

# restore prometheus configmap
2.restore-drop-label-patch.sh

# check prometheus ui graph, enter the below query.
node_uname_info 
node_procs_running
kube_configmap_info