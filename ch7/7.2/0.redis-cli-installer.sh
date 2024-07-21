#!/usr/bin/env bash
if (command -v redis-cli > /dev/null); then
  echo 'redis client is already installed.'
else
    apt-get install -y redis-server
fi