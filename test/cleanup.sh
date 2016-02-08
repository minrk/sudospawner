#!/bin/sh
set -ex

docker logs sudospawner-test
docker rm -f sudospawner-test
