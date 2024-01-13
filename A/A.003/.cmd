# 0-1. move prometheus to via web browser.
<shortcut> http://192.168.1.11
# search metrics node_cpu_seconds_total
 
# 0-2. Move to prometheus configuration ui to find configuration.
<shoutcut> http://192.168.1.11/config
# Enter Ctrl + F, kubernetes-service-endpoints
# Check job_name
# Below configuration default job config.

# 0-3. Explain relabel action 
# Check keep and drop action from __meta_kubernetes_service_annotation_prometheus_io_scrape and __meta_kubernetes_service_annotation_prometheus_io_scrape_slow.
# Check replace action from __meta_kubernetes_service_annotation_prometheus_io_scheme.
# Check labelmap action from  __meta_kubernetes_service_annotation_prometheus_io_param_(.+)
# Check labelmap action from  __meta_kubernetes_service_label_(.+)
# Check replace action set namespace label.
# Check replace action set service label.
# Check replace action set node label.

# 0-4. Explain scrape by kubernetes service discovery.
# Check kubernetes_sd_configs configuration

# 1-1. Move to prometheus graph ui.
<shortcut> http://192.168.1.11
# Search metrics: node_cpu_seconds_total
# Check prometheus label monitoring, node, service.

# 1-2. Check apply drop and replace relabel action shell script.
cat 1.add-relabel-configs.sh

# Check configmap vi editor.
# Search /start;
# Check drop action.
# Check replace action.

# 1-3. Apply labeldrop relabel action shell script.
./1.add-relabel-confings.yaml

# check drop action.
k annotate -n monitoring svc prometheus-node-exporter prometheus.io/exclude="true"

# revert annotate action.
k annotate -n monitoring svc prometheus-node-exporter prometheus.io/exclude-

# 1-4. Check labeldrop action has applied.
# Move to prometheus configruation ui.
# <shortcut> http://192.168.1.11/config
# Enter Ctrl + F, search heritage
# Check labeldrop action and regex heritage.
# Move to prometheus graph ui.
# search metrics node_uname_info
# check metrics  not found.
# search node_procs_running
# check metrics not found.

# 2-1. Check rollback config from shell script.
vi 2.rollback-basic-config.sh
# vim search <esc> /start
# drop, replace not found.

# 2-2. Rollback labeldrop action from shell script
2.rollback-basic-config.sh

# 2-3. Check labeldrop action has deleted.
# Move to prometheus configruation ui.
# <shortcut> http://192.168.1.11/config
# Enter Ctrl + F, search heritage
# Check heritage not found.
# Move to prometheus graph ui.
