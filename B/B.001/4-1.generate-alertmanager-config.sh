#!/usr/bin/env bash

# Choose pagerduty or opsgenie.
read -p 'Please enter your oncall: ' PRODUCT
# Copy the template file
cp $PRODUCT-notifier.yaml.tpl 4-2.$PRODUCT-notifier.yaml
# Prompt for the API token
read -p "Please enter your $PRODUCT API Key: " API_KEY
# Replace 'api_token' placeholder in the copied YAML file
sed -i -e "s,api-key,$API_KEY," 4-2.$PRODUCT-notifier.yaml
echo "Generate $PRODUCT notifier configuration successfully."
