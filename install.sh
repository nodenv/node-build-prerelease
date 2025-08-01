#!/bin/sh
# Usage: PREFIX=/usr/local ./install.sh
#
# Installs node-build under $PREFIX.

set -e

cd "$(dirname "$0")"

if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

SHARE_PATH="${PREFIX}/share/node-build"

mkdir -p "$SHARE_PATH"

install -p -m 0644 share/node-build/* "$SHARE_PATH"
