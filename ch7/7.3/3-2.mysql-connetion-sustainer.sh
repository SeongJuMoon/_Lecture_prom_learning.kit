#!/usr/bin/env bash

for i in {1..300}
do
  mysql -h 192.168.1.73 -uroot -proot -e 'select sleep(299);' > /dev/null &
  sleep 1
done
