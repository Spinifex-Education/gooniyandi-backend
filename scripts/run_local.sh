#!/usr/bin/env bash

set -ex

#run from root of project
docker build -f Dockerfile.dev -t gooniyandi-backend-dev .

docker run -d -p 3000:3000 --name admin-backend gooniyandi-backend-dev:latest

echo "Go to http://localhost:3000/ for the local admin console."