#!/bin/bash

# No unset vars and exit immidiately
set -ue

INSTANCE=$1
SERVER_NAME=$2
SERVER_PASSWORD=$3
SERVER_PORT=${4:-2456}

# Update
echo "--- Update Valheim Server"
/Steam/steamcmd.sh +force_install_dir /valheim +login anonymous +app_update 896660 +quit

echo
echo "--- Starting Valheim server"

LD_LIBRARY_PATH=/lib/x86_64-linux-gnu
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/valheim/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# Create instance dir
mkdir -p /valheim/$INSTANCE
mkdir -p /root/.config/unity3d/IronGate
ln -sf /valheim/$INSTANCE /root/.config/unity3d/IronGate/Valheim 

exec /valheim/valheim_server.x86_64 \
   -public 1 \
   -name "$SERVER_NAME" \
   -port $SERVER_PORT \
   -world "$INSTANCE" \
   -password "$SERVER_PASSWORD"

# EOF
