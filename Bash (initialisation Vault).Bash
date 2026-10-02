#!/bin/bash

############################################################
# VAULT INITIALIZATION
############################################################

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

echo "======================================"
echo " VAULT INITIALIZATION"
echo "======================================"

############################################################
# ENABLE KV
############################################################

vault secrets enable -path=secret kv-v2

############################################################
# STORE DATABASE SECRET
############################################################

vault kv put secret/postgres \
username="postgres" \
password="StrongPassword123"

############################################################
# STORE API SECRET
############################################################

vault kv put secret/api \
api_key="SUPER_SECRET_API_KEY"

############################################################
# STORE TELEGRAM SECRET
############################################################

vault kv put secret/telegram \
bot_token="TELEGRAM_BOT_TOKEN"

############################################################
# STORE SMTP SECRET
############################################################

vault kv put secret/smtp \
username="alert@oms-rdc.org" \
password="SMTP_PASSWORD"

############################################################
# VERIFY
############################################################

vault kv get secret/postgres

echo ""
echo "Vault configured successfully"
echo ""
echo "Vault UI:"
echo "http://localhost:8200"
echo ""