#!/usr/bin/env bash

mysql -h 192.168.1.73 -uroot -proot < db_scripts/max_allowed_packet/default > /dev/null
echo "mysql max_allowed_packet restore to default(64MB)!"

