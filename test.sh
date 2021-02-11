#!/usr/bin/env bash

set -euo pipefail

cat Dockerfile

dgoss run pivotal sleep 3
