#!/bin/sh -

TAG=$1
sudo docker build . -t lewangdev/certbot:${TAG} --build-arg VERSION=${TAG}
