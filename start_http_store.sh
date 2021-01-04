#!/bin/bash

PWD=`pwd`
source environment

echo ############################################
echo # Start HTTP Store
echo #
echo #

mkdir -p $HTTP_STORE_PATH
#chmod 777 $HTTP_STORE_PATH

podman pod create --name http-store -p $HTTP_PORT:8080

podman run -dt --pod http-store --env-file environment \
    -v $HTTP_STORE_PATH:/var/www/html:z \
    --name httpd \
    -d registry.centos.org/centos/httpd-24-centos7:latest

#podman logs $?
podman pod ps

podman ps --all

echo # Access HTTP Store at http://$HTTP_IP:$HTTP_PORT
echo #
echo ############################################
