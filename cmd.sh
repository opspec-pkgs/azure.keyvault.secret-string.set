#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting key vault secret"
if [ "$(az keyvault secret show --name "$name" --vault-name "$vaultName")" != "" ]
then
  echo "setting exiting key vault secret"
  az keyvault secret set \
    --description "$description" \
    --disabled "$disabled" \
    --expires "$expires" \
    --name "$name" \
    --vault-name "$vaultName" \
    --value "$value"
else
  echo "creating key vault secret"
  az keyvault secret set \
    --description "$description" \
    --disabled "$disabled" \
    --expires "$expires" \
    --name "$name" \
    --vault-name "$vaultName" \
    --value "$value"
fi