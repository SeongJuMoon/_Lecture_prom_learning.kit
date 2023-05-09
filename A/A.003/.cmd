# 0-1. move prometheus to via web browser.
<shortcut> http://192.168.1.11
# search metrics node_uname_info
 
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
# Search metrics: node_uname_info
# Check prometheus label monitoring, node, service.
# Check duplicate purpose label helm used.
# Helm v2 (heritage)
# Helm v3 (app_kubernetes_io/managed_by)
# Move superputty to drop duplicate purpose label.

# 1-2. Check apply labeldrop relabel action shell script.
cat 1.add-drop-label-patch.yaml

# Check configmap vi vi editor.
# Search /start;
# Check labeldrop action and regex heritage.

# 1-3. Apply labeldrop relabel action shell script.
./1.add-drop-label-patch.yaml

# 1-4. Check labeldrop action has applied.
# Move to prometheus configruation ui.
# <shortcut> http://192.168.1.11/config
# Enter Ctrl + F, search heritage
# Check labeldrop action and regex heritage.
# Move to prometheus graph ui.
# search metrics node_uname_info
# check heritage label not found.
# search node_procs_running
# check heritage label not found.

# 2-1. Check rollback labeldrop action from shell script.
vi 2.rollback-drop-label-patch.sh
# vim search <esc> /heritage
# heritage not found.

# 2-2. Rollback labeldrop action from shell script
./2.rollback-drop-label-patch.sh

# 2-3. Check labeldrop action has deleted.
# Move to prometheus configruation ui.
# <shortcut> http://192.168.1.11/config
# Enter Ctrl + F, search heritage
# Check heritage not found.
# Move to prometheus graph ui.
# search metrics node_uname_info
# check heritage label.
# search node_procs_running
# check heritage label.
