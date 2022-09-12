#!/usr/bin/env bash

echo "mysql max_allowed_packet up to 1GB."
mysql -h 192.168.1.73 -uroot -proot < db_scripts/max_allowed_packet/1gb > /dev/null