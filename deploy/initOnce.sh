#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

cd ..

PROJECT=$(basename $(pwd))

cd $DIR

mv API.service $PROJECT.service
git add .
git commit -m"rename API.service → $PROJECT.service"
find . -type f \( -name "*.service" -o -name "*.sh" \) -exec sed -i "s/API/$PROJECT/g" {} +
