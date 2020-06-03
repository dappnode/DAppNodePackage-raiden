#!/bin/sh
set -e

function sleep_forever() {
    while true; do sleep 5; done
}
KEYSTORE_PATH="/root/.raiden"
KEYSTORE_FILE="${KEYSTORE_PATH}/keystore.json"

if [ ! -f "${KEYSTORE_FILE}" ]; then
    echo "Keystore file not present!"
    sleep_forever
fi

# Convert keystore address to EIP-55 format
RAW_ADDRESS=$(cat ${KEYSTORE_FILE} | jq -r .address)
RAIDEN_ADDRESS=$(echo -n ${RAW_ADDRESS} | eip55-checksum)
export RAIDEN_ADDRESS

echo "${RAIDEN_KEYSTORE_PASSWORD}" >/root/.raiden/.password

# Generate config file from template
envsubst <config.toml.template >config.toml

echo "Starting Raiden node for: ${RAIDEN_ADDRESS}"
exec raiden --config-file ./config.toml
