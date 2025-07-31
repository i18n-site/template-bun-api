#!/usr/bin/env bash
set -e
DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
. /etc/profile
set -a
. production.env
set +a
set -x

exec bun run --smol --port=$PORT -b API.js
