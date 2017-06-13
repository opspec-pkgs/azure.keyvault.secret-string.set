# problem statement
creates an azure keyvault secret or sets existing secret with new value

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
      azureUsername:
      azurePassword:
      name:
      vaultName:
      value:
      # begin optional args
      description:
      disabled:
      expires:
      # end optional args
```