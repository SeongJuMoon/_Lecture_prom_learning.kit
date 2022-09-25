# phase 1, vagrant harbor setting
cd 1.vagrantup-harbor
vagrant up

# check harbor ui,
# shortcut http://192.168.1.92, admin / admin
# view harbor portal

# m-k8s

# upgrade prometheus-stack to prometheus scraping harbor metrics.
./1.prometheus-stack-upgrader-15s.sh

# container pull / push to harbor.
./2.docker-image-pullpush-to-harbor.sh

# check blow promql using browser prometheus ui.
harbor_project_repo_total

# remove harbor on your host machine.
vagrant destroy -f
