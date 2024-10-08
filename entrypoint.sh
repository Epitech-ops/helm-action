#!/bin/sh -l

if [ -z "$1" ]; then
  echo "Error: url is required"
fi
if [ -z "$2" ]; then
  echo "Error: template name is required"
fi

helm_url=$1
helm_template=$2
helm_user=$3
helm_password=$4
values_file=$5
debug=$6

debug_option=""

if [ -z "$helm_user" ] || [ -z "$helm_password" ]; then
  echo "Fetching the Helm repository in unauthenticated mode"
  helm repo add organization $helm_url
else
  echo "Fetching the Helm repository in authenticated mode"
  helm repo add organization $helm_url --username $helm_user --password $helm_password
fi

if [ -n "$debug" ] && [ "$debug" = "true" ]; then
  debug_option="--debug"
fi

helm repo update
helm fetch organization/$helm_template

if [ -n "$values_file" ]; then
  helm template organization/$helm_template $debug_option -f values.yaml -f $values_file > template.yaml
else
  helm template organization/$helm_template $debug_option -f values.yaml > template.yaml
fi
