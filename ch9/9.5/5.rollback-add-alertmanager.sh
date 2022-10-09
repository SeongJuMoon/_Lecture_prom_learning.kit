#!/usr/bin/env bash

helm -n monitoring rollback prometheus-stack
