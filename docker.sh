#!/usr/bin/env bash

set -euo pipefail

function login {
    echo "*** Docker hub login"
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
}

function deploy {
    echo "*** Deploy to Docker Hub"
    docker build -t "bzhtux/pivotal:$TRAVIS_TAG" .
    docker push "bzhtux/pivotal:$TRAVIS_TAG"
}

login
deploy