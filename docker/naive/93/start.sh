#!/bin/bash

# /root/crab/tools/docker/naive/Caddyfile:/koo/Caddyfile
# /root/crab/tools/docker/naive/Caddyfile 可以覆盖镜像中的 Caddyfile文件

docker run -it --restart=always --name naive93v0.0.2 -v /root/crab/tools/docker/naive/Caddyfile:/koo/Caddyfile naive-server:v0.1