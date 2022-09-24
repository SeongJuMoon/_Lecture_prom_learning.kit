#!/usr/bin/env bash
if (command -v redis-cli > /dev/null); then
  echo 'redis client is already installed.'
else
    yum install -y redis
fi