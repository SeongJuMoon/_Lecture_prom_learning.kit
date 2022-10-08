# phase 1, vagrant harbor setting
cd 1.vagrantup-harbor
vagrant up

# check harbor ui,
# shortcut https://192.168.1.92
# credential: admin / admin
# view harbor portal

k get -n monitoring secret prometheus-prometheus-stack-kube-prom-prometheus -o yaml

# m-k8s
# upgrade prometheus-stack to scrape harbor metrics.
./1.prometheus-stack-upgrader-15s.sh

# container pull / push to harbor.
./2.docker-image-pullpush-to-harbor.sh

# check blow promql using browser prometheus ui.
harbor_project_repo_total

# remove harbor on your host machine.
vagrant destroy -f
