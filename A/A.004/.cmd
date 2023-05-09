# 1-1. check servicemonitor yaml, before apply via kubectl.
vi 1.smon-nginx-relabeling.yaml
# vim print line number
# <esc> set nu

# 1-2. apply servicemonitor for add relabeling config from nginx-exporter.
k apply -f 1.smon-nginx-relabeling.yaml

# 1-3. check servicemonitor deployed on k8s cluster.
k get servicemonitor-n monitoring

# 2-1. check directory 2.nginx before apply via kubectl.
ls 2.nginx

# 2-2. check annotation,labels in service.yaml via vi editor.
vi 2.nginx/service.yaml
# vim print line number
# <esc> set nu
# check annotations 5 lines.
# check labels 7-9 lines.
# check selector 21-22 lines.

# 2-3. deploy nginx and nginx-exporter.
k apply -f 2.nginx

# 2-4. check nginx and nginx-exporter.
k get po,svc

# 3-1. move to prometheus configuration ui.
# <shoutcut> http://192.168.1.11/config
# Enter Ctrl + F, search nginx
# until scroll down to found __meta_kubernetes_service_annotation_prometheus_io_scrape.
# check next relabel action labelmap for all kubernetes label convert to prometheus label.

# 3-2.move to prometheus graph ui to check nginx-exporter metrics.
nginx_up
# check metric result.
# check service label convert to prometheus label.

# 4-1. delete nginx and nginx-exporter.
k delete -f 2.nginx

# 4-2. check  nginx and nginx exporter deleted on k8s cluster.
k get po,svc

# 4-3. delete servicemonitor.
k delete -f 1.smon-nginx-relabeling.yaml

# 4-4. check servicemonitor deleted on k8s cluster.
k get servicemonitor-n monitoring
