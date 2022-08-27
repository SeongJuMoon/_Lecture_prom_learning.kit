vagrant up

# 슈퍼 푸티를 통해서 192.168.1.64로 접속합니다.
~/_Lecture_prom_learning.kit/ch6/6.4/create-certificate.sh
~/_Lecture_prom_learning.kit/ch6/6.4/harbor/install.sh

# 브라우저에서 https://192.168.1.64 접속합니다.

cat ~/_Lecture_prom_learning.kit/ch6/6.4/harbor/harbor.yml | nl

# 브라우저에서 http://192.168.1.64:9090/metrics 접속합니다.

cat ~/_Lecture_prom_learning.kit/ch6/6.4/target-add-to-prometheus.yml | nl

kubectl patch configmap prometheus-server -n monitoring --patch-file ~/_Lecture_prom_learning.kit/ch6/6.4/target-add-to-prometheus.yml
