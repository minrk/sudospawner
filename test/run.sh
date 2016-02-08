#!/bin/sh
set -x

docker run -d -p 8000:8000 --name sudospawner-test -t sudospawner jupyterhub --no-ssl
py.test sudospawner


