#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

if [ ! -d "node_modules" ]; then
  bun i
fi

bun x cep -c src -o lib $@
