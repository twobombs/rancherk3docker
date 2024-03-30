#!/bin/bash

echo 'fetch k3d'
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo 'run rancher'
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:latest

echo 'start cluster'
k3d cluster create boxed -a 4 &

sleep 10

echo 'done - now go to https://localhost'

sleep 20

screen glances

tail -f /dev/null
