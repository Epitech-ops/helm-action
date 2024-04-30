#!/bin/sh -l

if [ -z "$1" ]; then
  echo "Error: url is required"
fi
if [ -z "$2" ]; then
  echo "Error: user is required"
fi
if [ -z "$3" ]; then
  echo "Error: password is required"
fi

helm_url=$1
helm_user=$2
helm_password=$3
values_file=$4

helm repo add organization $helm_url --username $helm_user --password $helm_password
helm repo update
helm fetch organization/template

if [ -n "$values_file" ]; then
  helm template organization/template -f values.yaml -f $values_file > template.yaml
else
  helm template organization/template -f values.yaml > template.yaml
fi
