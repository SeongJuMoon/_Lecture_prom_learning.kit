
# check relabeling config.

# deploy nginx 
k apply -f 2.nginx-no-annotations

# apply servicemonitor for nginx
k apply -f 1.smon-no-annotation-drop.yaml

# check target ui, doesn't scrape metrics via servicemonitor
shortcut http://192.168.1.11/target

# add annotate service prometheus.io/scrape=true  to scrape metrics, enter the below commmand.
k annotate svc nginx prometheus.io/scrape=true

# check target ui, scrape metrics via servicemonitor
shortcut http://192.168.1.11/target

# check query ui, show labels kubernetes label mapped.
shortcut http://192.168.1.11/graph

nginx_up
# nginx_up{app="nginx", container="exporter", duty="DevOps", endpoint="metrics", instance="172.16.221.136:9113", job="nginx", namespace="default", pod="nginx-594d4f7658-cghr5", service="nginx", tier="frontend"}

# clean up current lab
k delete -f ./2.nginx-no-annotations
k delete -f ./1.smon-no-annotation-drop.yaml
