#!/bin/sh
sleep 60
touch /vault/vault_is_executing
if [ ! -f /vault/vault_keys ]; then 
    /bin/vault operator init>/vault/vault_keys;
fi
/bin/vault operator unseal `grep 'Key 1:' /vault/vault_keys | awk '{print $NF}'`
/bin/vault operator unseal `grep 'Key 2:' /vault/vault_keys | awk '{print $NF}'`
/bin/vault operator unseal `grep 'Key 3:' /vault/vault_keys | awk '{print $NF}'`