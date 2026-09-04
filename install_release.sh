#!/usr/bin/env bash
set -e

BUILDDIR=build-auto

echo "[SLINK] Building client and Android server..."

rm -rf "$BUILDDIR"

meson setup "$BUILDDIR" \
    --buildtype=release \
    --strip \
    -Db_lto=true

cd "$BUILDDIR"

ninja

echo "[SLINK] Installing..."
sudo ninja install