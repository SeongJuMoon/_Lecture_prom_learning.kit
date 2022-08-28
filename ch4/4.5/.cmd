# 192.168.1.11 프로메테우스 UI로 이동합니다.

metallb_allocator_addresses_in_use_total #2

kubectl create deploy chk-hn --image sysnet4admin/chk-hn --replicas=1
kubectl expose deploy chk-hn --name chk-hn-loadbalancer --type=LoadBalancer --port 80 --target-port 80

metallb_allocator_addresses_in_use_total #3

# 메탈 LB에 prometheus.io/scrape 및 prometheus.io/port 정보가 설정되있는 것을 확인합니다
kubectl get pods -n metallb-system -o yaml | grep annotation -C 3

# 그러면, 이렇게 설정한 정보는 어떻게 프로메테우스가 가져올까요? 그 답은
프로메테우스 컨피그 서버에 존재합니다.

kubectl get cm prometheus-server -n monitoring -o yaml | nl
