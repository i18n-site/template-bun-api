#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

PROJECT=$(basename $DIR)
HOSTNAME=${1:-hrai}
TARGET_DIR=/opt/$PROJECT
TARGET=$HOSTNAME:$TARGET_DIR

./build.sh

cd lib
mv srv.js $PROJECT.js
cd ..

initOnce=./deploy/initOnce.sh
if [ -f "$initOnce" ]; then
  $initOnce
  rm $initOnce
fi

sync() {
  rsync --mkpath -avz --exclude=.git $1 $TARGET
}

rsync conf/production.env $TARGET
sync lib/
sync deploy/
sync package.json

ssh $HOSTNAME "cd /opt/$PROJECT  && . /etc/profile && bun i && $TARGET_DIR/enable.sh"
