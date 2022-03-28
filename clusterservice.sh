#!/bin/sh

set -x

pushd kong/templates
  mv service-kong-cluster.yaml service-kong-clusterservice.yaml
  sed -i'.bak' 's/Values\.cluster\./Values\.clusterservice\./g' *.yaml
  sed -i'.bak' 's/Values\.cluster /Values\.clusterservice /g' *.yaml
  sed -i'.bak' 's/Values\.cluster/Values\.clusterservice/g' *.tpl
  rm -f *.bak
popd

pushd kong
  sed -i'.bak' 's/cluster:/clusterservice:/g' values.yaml
  rm -f *.bak
popd
