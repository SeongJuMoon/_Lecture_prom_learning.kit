# 1. 서비스 모니터를 확인하기 위해서 수집 대상 애플리케이션인 엔진엑스를 배포합니다.
kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.7/nginx

# 2. nginx가 배포되었다면, nginx를 오퍼레이터가 관리하는 프로메테우스가 수집할 수 있도록 서비스 모니터를 설정합니다.
