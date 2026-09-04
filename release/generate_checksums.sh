#!/bin/bash
set -ex
cd "$(dirname ${BASH_SOURCE[0]})"
. build_common

cd "$OUTPUT_DIR"
sha256sum "SLINK-server-$VERSION" \
    "SLINK-linux-x86_64-$VERSION.tar.gz" \
    "SLINK-win32-$VERSION.zip" \
    "SLINK-win64-$VERSION.zip" \
    "SLINK-macos-aarch64-$VERSION.tar.gz" \
    "SLINK-macos-x86_64-$VERSION.tar.gz" \
        | tee SHA256SUMS.txt
echo "Release checksums generated in $PWD/SHA256SUMS.txt"
