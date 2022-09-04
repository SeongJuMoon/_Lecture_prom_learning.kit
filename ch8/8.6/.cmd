vagrant up

# harbor
# 슈퍼 푸티를 통해서 192.168.1.86로 접속합니다.
~/_Lecture_prom_learning.kit/ch8/8.6/create-certificate.sh
~/_Lecture_prom_learning.kit/ch8/8.6/harbor/install.sh

# 브라우저에서 https://192.168.1.86 접속합니다.

cat ~/_Lecture_prom_learning.kit/ch8/8.6/harbor/harbor.yml | nl

# 브라우저에서 http://192.168.1.86:9090/metrics 접속합니다.


# m-k8s

# 추가로 수집하기 위한 스크래이프 컨피그를 확인합니다
cat ~/_Lecture_prom_learning.kit/ch8/8.6/harbor-scrape-config.yaml | nl

# 오퍼레이터에 연결하기 위해서 스크래이프 컨피그를 시크릿으로 만듭니다.
kubectl create secret generic external-harbor-scrape-config --from-file=~/_Lecture_prom_learning.kit/ch8/8.6/harbor-scrape-config.yaml


