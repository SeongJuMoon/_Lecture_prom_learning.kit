#!/usr/bin/env bash

NODE_COUNT=3
docker_V='5:24.0.6-1~ubuntu.22.04~jammy' 

for (( i=1; i<=$NODE_COUNT; i++ ));
  do
  TARGET="192.168.1.10$i"
  echo "[Step $i/3] Installing docker on $TARGET"
  sshpass -p vagrant ssh -o stricthostkeychecking=no root@$TARGET "echo apt-get install docker-ce=$docker_V docker-ce-cli=$docker_V -y  > /tmp/install_docker.sh"
  sshpass -p vagrant ssh root@$TARGET bash /tmp/install_docker.sh > /dev/null 2>&1
  done
echo "Successfully completed"
