#!/bin/bash
# script for prepopulating Docker images needed for OLM

docker pull quay.io/coreos/olm:master-73bc1d54
docker tag quay.io/coreos/olm:master-73bc1d54 quay.io/coreos/olm:latest
docker pull quay.io/coreos/catalog:master-57dd618d
docker tag quay.io/coreos/catalog:latest
