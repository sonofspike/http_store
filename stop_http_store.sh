#!/bin/bash

echo ############################################
echo # Stop HTTP Store
echo #
echo ############################################
podman pod rm -f http-store | true

