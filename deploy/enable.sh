#!/usr/bin/env bash

DIR=$(realpath $0) DIR=${DIR%/*}
cd $DIR
set -ex

rm -f /etc/systemd/system/API.service
cp API.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable API
systemctl restart API
