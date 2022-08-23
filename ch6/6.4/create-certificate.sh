#!/usr/local/env bash

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=KR/ST=Seoul/L=Seoul/O=example/OU=Personal/CN=192.168.1.64" \
 -key ca.key \
 -out ca.crt

openssl genrsa -out local-harbor.key 4096
openssl req -sha512 -new \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=example/OU=Personal/CN=192.168.1.64" \
    -key local-harbor.key \
    -out local-harbor.csr

openssl x509 -req -sha512 -days 3650 \
    -extfile csr-v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in local-harbor.csr \
    -out local-harbor.crt

# data dir
cp local-harbor.crt /data/cert/
cp local-harbor.key /data/cert/