#!/bin/bash
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then 
 exit 0
fi 

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t kryptedgaming/krypted:latest . --no-cache
if [ $? -ne 0 ]; then 
    exit 1
fi 
docker push kryptedgaming/krypted:latest
if [ $? -ne 0 ]; then 
    exit 1
fi 

exit 0 