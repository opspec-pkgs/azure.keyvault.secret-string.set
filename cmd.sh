#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for existing key vault secret"
if [ "$(az keyvault secret show --name "$name" --vault-name "$vaultName")" != "" ]
then
  echo "existing secret found"
  
  if [ "$(az keyvault secret show --output json --name "$name" --vault-name "$vaultName" | jq --raw-output '.value')" = "$value" ]
  then
    echo "existing secret contains same value"
  else
    echo "updating existing secret value"
    az keyvault secret set \
      --description "$description" \
      --disabled "$disabled" \
      --expires "$expires" \
      --name "$name" \
      --vault-name "$vaultName" \
      --value "$value" \
      >/dev/null
    fi
else
  echo "creating new keyvault secret"
  az keyvault secret set \
    --description "$description" \
    --disabled "$disabled" \
    --expires "$expires" \
    --name "$name" \
    --vault-name "$vaultName" \
    --value "$value" \
    >/dev/null
fi
