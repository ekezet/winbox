#!/bin/sh
chown -R wine:wine /winbox
echo "[Entrypoint] Starting Winbox $WV"
gosu wine:wine sh -c 'wine64 /winbox/winbox64.exe'
