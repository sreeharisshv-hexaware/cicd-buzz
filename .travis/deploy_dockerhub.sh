#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t "cicd-buzz" .
docker tag cicd-buzz:latest 37913hexaware/cicd-buzz:latest
docker push 37913hexaware/cicd-buzz:latest