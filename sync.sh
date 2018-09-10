#!/usr/bin/env bash

set -e

GCRSYNC_VERSION=v1.1.4

wget -q https://github.com/mritd/gcrsync/releases/download/${GCRSYNC_VERSION}/gcrsync_linux_amd64 -O gcrsync
chmod +x gcrsync
./gcrsync --querylimit 20 --processlimit 10 --user ${DOCKER_USER} --password ${DOCKER_PASSWORD}

rm -f gcrsync

git add .
git commit -m "Travis CI Auto Synchronized."
git push --force https://$GITHUB_TOKEN@github.com/mritd/gcr.git master
