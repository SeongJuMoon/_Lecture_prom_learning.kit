#!/usr/bin/env bash

for i in {1..50}
do
  mysql -h 192.168.1.73 -uroot -proot -e 'select sleep(60);' > /dev/null &
done
