#!/usr/bin/env bash

set -euo pipefail

DOCKER_TAG={$TRAVIS_TAG:-master}

function login {
    echo "*** Docker hub login"
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
}

function deploy {
    echo "*** Deploy to Docker Hub"
    docker build -t "bzhtux/pivotal:$DOCKER_TAG" .
    docker push "bzhtux/pivotal:$DOCKER_TAG"
}

login
deploy