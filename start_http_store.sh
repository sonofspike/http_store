#!/bin/bash

PWD=`pwd`
source environment

echo ############################################
echo # Start HTTP Store
echo #

mkdir -p $HTTP_STORE_PATH

podman pod create --name http-store -p $HTTP_PORT

podman run -dt --pod http-store --env-file environment \
    -v $PWD/nginx.conf:/bitnami/nginx/conf/nginx.conf \
    -v $HTTP_STORE_PATH:/var/www/files \
    --name store quay.io/bitnami/nginx:latest

echo # Access HTTP Store at http://localhost:8080
echo #
echo ############################################
