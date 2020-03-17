#!/usr/bin/env bash

set -euo pipefail

docker build -t pivotal .

dgoss run pivotal sleep 3