#!/bin/sh
version=3.27
chown -R wine:wine /winbox
echo "[Entrypoint] Starting Winbox $version"
gosu wine:wine sh -c 'wine64 /winbox/winbox64.exe'
