#!/bin/sh

# Add capabilities to bind port 80
#setcap 'cap_net_bind_service=+ep' /usr/bin/raiden

if [ ! -z $RAIDEN_ADDRESS ] && [ -f ./password ] && [ -z ! "$(ls -A /home/raiden/keystore)" ]; then
    /usr/bin/raiden --accept-disclaimer --environment-type production --api-address 0.0.0.0:80 --eth-rpc-endpoint $RAIDEN_RPC --keystore-path /home/raiden/keystore --address $RAIDEN_ADDRESS --password-file password
else
    echo "########################################################"
    echo "## Raiden not properly configured!                    ##"
    echo "## Make sure you have done the following steps:       ##"
    echo "## 1: Uploaded a keystore to /home/raiden/keystore/   ##"
    echo "## 2: Uploaded a password file, named 'password'      ##"
    echo "## 3: Set the corresponding \$RAIDEN_ADDRESS variable  ##"
    echo "## 4: Restart the package                             ##"
    echo "########################################################"
    while true; do sleep 20; done
fi