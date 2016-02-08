#!/bin/sh
set -ex

cp test/Dockerfile ./
cp test/jupyterhub_config.py ./
docker build -t sudospawner .
