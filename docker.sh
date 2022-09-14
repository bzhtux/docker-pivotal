#!/usr/bin/env bash

set -euo pipefail

TRIGGER=${TRAVIS_TEST_RESULT:-1}
DOCKER_TAG=${TRAVIS_TAG:-master}

case $TRIGGER in
    0) case $DOCKER_TAG in
            master) SRC_NAME="Branch"
                ;;
            *) SRC_NAME="Tag"
                ;;
        esac
        ;;
    1) echo "Tests failed, no trigger set for docker hub build"
        ;;
esac

curl -X POST \
        -H "Content-Type: application/json" \
        -d "{\"source_type\": \"${SRC_NAME}\", \"source_name\": \"${DOCKER_TAG}\"}" \
        https://hub.docker.com/api/build/v1/source/d5cbd3b0-8269-48d1-85f2-ce14149f7e3f/trigger/c6a596e3-d753-41e2-ae1c-1d6acaa5d16b/call/