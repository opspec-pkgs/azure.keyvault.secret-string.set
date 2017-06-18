# problem statement
sets a string secret in azure keyvault (if it's not already set)

# example usage

> note: in examples, VERSION represents a version of the azure.keyvault.secret.set pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.keyvault.secret.set#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.keyvault.secret.set#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.keyvault.secret.set#VERSION }
    inputs:
      subscriptionId:
      loginId:
      loginSecret:
      name:
      vaultName:
      value:
      # begin optional args
      loginTenantId:
      loginType:
      expires:
      description:
      disabled:
      # end optional args
```
