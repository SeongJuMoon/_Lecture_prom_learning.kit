# 1.vagrantup for new harbor VM on HOST machine(windows,MacOS)
cd ~/_Lecture_prom_learning.kit/ch6/6.3/1.vagrantup-harbor 
vagrant up

# 2.harbor install ON NEW harbor VM (192.168.1.63)
ssh 192.168.1.63 / password is 'vagrant' 
# generate certificate 
~/_Lecture_prom_learning.kit/ch6/6.3/2.harbor-certificate/create-certificate.sh
# install harbor docker-compose 
~/_Lecture_prom_learning.kit/ch6/6.3/3.harbor-app/install.sh

# 3.harbor status check 
# check harbor status thru web browse (192.168.1.63)

# check exposed metrics by harbor app   
cat ~/_Lecture_prom_learning.kit/ch6/6.3/3.harbor-app/harbor.yml | grep metric: -A 4
# double-check exposed metrics by web browse 
http://192.168.1.63:9090/metrics

# 4.add exposed metrics to the prometheus(SD/service discovery)
# run ON m-k8s 
# confirm & add static address app 
cat ~/_Lecture_prom_learning.kit/ch6/6.3/4.add-harbor-to-the-prometheus.yaml | grep harbor -A 5
kubectl patch configmap prometheus-server -n monitoring --patch-file ~/_Lecture_prom_learning.kit/ch6/6.3/4.add-harbor-to-the-prometheus.yaml 
# check register on prometheus web ui's target 

# 5.validation for metrics value on harbor 
./5.docker-image-pullpush-to-harbor.sh
# check harbor's library status thru web browse (192.168.1.63) i.e. nginx uploaded?
PromQL: harbor_project_repo_total

# 6. removal harbor scrape config by overwrite prometheus config
# check there are return empty content.
cat ~/_Lecture_prom_learning.kit/ch6/6.3/6.removal-harbor-to-the-prometheus.yaml | grep harbor
# mutate prometheus-server config
kubectl patch configmap prometheus-server -n monitoring --patch-file ~/_Lecture_prom_learning.kit/ch6/6.3/6.removal-harbor-to-the-prometheus.yaml
# check register on prometheus web ui's target 

#7 agrant destroy for new harbor VM on HOST machine(windows,MacOS)
cd ~/_Lecture_prom_learning.kit/ch6/6.3/1.vagrantup-harbor 
vagrant destroy -f
# check your virtualbox host ui, there are no harbor vm instance.