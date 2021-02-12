#!/usr/bin/env bash

set -euo pipefail

echo "<--% START DOCKERFILE %-->"
cat Dockerfile
echo "<--% END DOCKERFILE %-->"

# DGOSS tests
dgoss run pivotal sleep 3

# Trigger docker build and pubish to docker hub
curl -X POST https://hub.docker.com/api/build/v1/source/d5cbd3b0-8269-48d1-85f2-ce14149f7e3f/trigger/c6a596e3-d753-41e2-ae1c-1d6acaa5d16b/call/
