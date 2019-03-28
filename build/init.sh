#!/bin/sh

# Check if password is set, and at least one file has been uploaded
if [ ! -z ${RAIDEN_KEYSTORE_PASSWORD} ] && [ `find . -maxdepth 1 -type f | wc -l` -gt 0 ]; then
    expect -c  "spawn raiden --keystore-path . --accept-disclaimer; 
                sleep 3; 
                expect -re \"password\";
                send \"${RAIDEN_KEYSTORE_PASSWORD}\r\n\";
                set timeout -1;
                expect -re \"100%\";"
else
    echo
    echo "########################################################"
    echo "## Raiden not configured to start!                    ##"
    echo "## Please follow the following steps:                 ##"
    echo "## 1: Upload a keystore file                          ##"
    echo "## 2: Set the RAIDEN_KEYSTORE_PASSWORD to open it     ##"
    echo "## 3: Restart the package                             ##"
    echo "########################################################"
    while true; do sleep 5; done
fi
