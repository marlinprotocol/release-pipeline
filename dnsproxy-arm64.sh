#!/bin/sh

# To be used inside a golang docker container for reproducible builds

set -e

cd /

wget -O - https://musl.cc/aarch64-linux-musl-native.tgz | tar -xz

cd /code

CC=/aarch64-linux-musl-native/bin/aarch64-linux-musl-gcc go build -ldflags='-buildid= -s -w -linkmode external -extldflags "-static"' -buildvcs=false
