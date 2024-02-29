#!/bin/sh -

TAG=$1

#sudo docker buildx build --platform linux/arm64,linux/amd64 . -t lewangdev/certbot:${TAG}  --build-arg VERSION=${TAG} --push
sudo docker buildx build --platform linux/arm64,linux/amd64 . -t lewangdev/certbot:latest -t lewangdev/certbot:${TAG} --build-arg VERSION=${TAG} --push
