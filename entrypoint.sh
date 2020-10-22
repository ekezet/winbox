#!/bin/sh
version=3.24
chown -R wine:wine /winbox
echo "[Entrypoint] Starting Winbox $version"
gosu wine:wine sh -c 'wine64 /winbox/winbox64.exe'
