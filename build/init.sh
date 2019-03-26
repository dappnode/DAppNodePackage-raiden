#!/bin/sh

if [ ! -z $RAIDEN_ADDRESS ] && [ -f ./password ] && [ `ls -1A keystore | wc -l` -gt 0 ]; then
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
    while true; do sleep 2; done
fi