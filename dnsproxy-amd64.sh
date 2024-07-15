#!/bin/sh

# To be used inside a golang docker container for reproducible builds

set -e

cd /

wget -O - https://musl.cc/x86_64-linux-musl-native.tgz | tar -xz

cd /code

CC=/x86_64-linux-musl-native/bin/x86_64-linux-musl-gcc go build -ldflags='-buildid= -s -w -linkmode external -extldflags "-static"' -buildvcs=false
