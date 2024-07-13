#!/bin/sh

# To be used inside a golang docker container for reproducible builds

set -e

cd /

wget -O - https://musl.cc/aarch64-linux-musl-native.tgz | tar -xz

cd /code

go generate

CC=/x86_64-linux-musl-native/bin/aarch64-linux-musl-gcc go build -tags release -a -ldflags " -s -w -linkmode external -extldflags -static" -o supervisord -buildvcs=false
