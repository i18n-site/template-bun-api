#!/usr/bin/env bash
set -e
DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -a
. ./conf/development.env
set +a
. ./sh/pid.sh
set -x

rm -rf lib && ./build.sh

bun x concurrently --names "js,app" \
  './build.sh -w' \
  "bun run --smol --port $PORT -b --watch lib/app.js"
