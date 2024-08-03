#!/usr/bin/env bash

# Copy the template file
cp opsgenie-notifier.yaml.tpl 4-2.opsgenie-notifier.yaml
# Prompt for the API token
read -p 'Please enter your Opsgenie API Key: ' API_KEY
# Replace 'api_token' placeholder in the copied YAML file
sed -i -e "s,api-key,$API_KEY," 4-1.opsgenie-notifier.yaml
echo 'Generate Opsgenie notifier configuration successfully.'
