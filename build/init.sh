#!/bin/sh

if [ ! -z ${RAIDEN_ADDRESS} ] && [ -f ${RAIDEN_PASSWORD_FILE} ] && [ `ls -1A ${RAIDEN_KEYSTORE_PATH} | wc -l` -gt 0 ]; then
        raiden --address ${RAIDEN_ADDRESS}
else
    echo "########################################################"
    echo "## Raiden not properly configured!                    ##"
    echo "## Make sure you have done the following steps:       ##"
    echo "## 1: Uploaded a keystore to /root/.raiden/keystore/  ##"
    echo "## 2: Uploaded a password file, named 'password'      ##"
    echo "## 3: Set the corresponding \$RAIDEN_ADDRESS variable  ##"
    echo "## 4: Restart the package                             ##"
    echo "########################################################"
    while true; do sleep 2; done
fi