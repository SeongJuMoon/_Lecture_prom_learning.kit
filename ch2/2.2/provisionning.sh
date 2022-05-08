#!/usr/bin/env bash

# 프로비저닝 스크립트가 위치하는 디렉터리
SCRIPTDIR=$HOME/_Lecture_prometheus_learning.kit/ch2/2.2/provisionning
# 헬름 업데이트
source $SCRIPTDIR/helm-install.sh
# 교육용 차트 저장소 등록 및 업데이트
source $SCRIPTDIR/helm-repo-configuration.sh
# metallb 설치
source $SCRIPTDIR/metallb-install.sh
# NFS 서버 설정
source $SCRIPTDIR/nfs-exporter.sh dynamic-vol
# 동적 프로비저너 및 storageclass 설정
source $SCRIPTDIR/nfs-provisioner-install.sh