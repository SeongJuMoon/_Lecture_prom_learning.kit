#!/usr/bin/env bash

PASSWORD="vagrant"
CERT_DIR="/etc/docker/certs.d/192.168.1.64"

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=KR/ST=Seoul/L=Seoul/O=lecture/OU=prometheus/CN=192.168.1.64" \
 -key ca.key \
 -out ca.crt

openssl genrsa -out harbor.key 4096
openssl req -sha512 -new \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=lecture/OU=prometheus/CN=192.168.1.64" \
    -key harbor.key \
    -out harbor.csr

openssl x509 -req -sha512 -days 3650 \
    -extfile /root/_Lecture_prom_learning.kit/ch6/6.4/csr-v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in harbor.csr \
    -out harbor.crt

yum install -y sshpass

openssl x509 -inform PEM -in harbor.crt -out harbor.cert

sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no root@192.168.1.10 mkdir -p $CERT_DIR
sshpass -p $PASSWORD scp ca.crt root@192.168.1.10:$CERT_DIR
sshpass -p $PASSWORD scp harbor.key root@192.168.1.10:$CERT_DIR
sshpass -p $PASSWORD scp harbor.cert root@192.168.1.10:$CERT_DIR

for i in {1..3}
do
    sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no root@192.168.1.10$i mkdir -p $CERT_DIR
    sshpass -p $PASSWORD scp ca.crt root@192.168.1.10$i:$CERT_DIR
    sshpass -p $PASSWORD scp harbor.key root@192.168.1.10$i:$CERT_DIR
    sshpass -p $PASSWORD scp harbor.cert root@192.168.1.10$i:$CERT_DIR
done

mkdir /root/_Lecture_prom_learning.kit/ch6/6.4/tls/

mv ca.key /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv ca.crt /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv ca.srl /root/_Lecture_prom_learning.kit/ch6/6.4/tls/

mv harbor.csr /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv harbor.cert /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv harbor.crt /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv harbor.key /root/_Lecture_prom_learning.kit/ch6/6.4/tls/