#!/usr/bin/env bash

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
    -extfile csr-v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in harbor.csr \
    -out harbor.crt

mkdir /root/_Lecture_prom_learning.kit/ch6/6.4/tls/


mv ca.key /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv ca.crt /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv harbor.csr /root/_Lecture_prom_learning.kit/ch6/6.4/tls/

mv harbor.crt /root/_Lecture_prom_learning.kit/ch6/6.4/tls/
mv harbor.key /root/_Lecture_prom_learning.kit/ch6/6.4/tls/