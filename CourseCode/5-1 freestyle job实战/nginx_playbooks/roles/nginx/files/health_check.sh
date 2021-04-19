#!/bin/sh

URL=$1

curl -Is http://$URL > /dev/null && echo "The remote side is healthy" || echo "The remote side is failed, please check"
