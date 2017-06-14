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
    --value "$value" \
    >/dev/null
  echo "secret set"
else
  echo "creating key vault secret"
  az keyvault secret set \
    --description "$description" \
    --disabled "$disabled" \
    --expires "$expires" \
    --name "$name" \
    --vault-name "$vaultName" \
    --value "$value" \
    >/dev/null
  echo "secret created"
fi
