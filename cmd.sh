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

echo 'setting default subscription'
az account set --subscription "$subscriptionId"
### end login

### Guard: only update if changed to avoid unnecessary versioning
echo 'checking if secret exists'
if [ "$(az keyvault secret show --query 'value' --output tsv --name "$name" --vault-name "$vault")" = "$value" ]
then
  echo 'secret exists'
  exit
fi

echo 'setting secret'
az keyvault secret set \
--description "$description" \
--disabled "$disabled" \
--expires "$expires" \
--vault-name "$vault" \
--name "$name" \
--value "$value" \
>/dev/null
