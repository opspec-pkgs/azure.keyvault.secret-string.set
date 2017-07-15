# Problem statement
sets a secret string in azure keyvault (if it's not already set)

# Example usage

> note: in examples, VERSION represents a version of the azure.keyvault.secret-string.set pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.keyvault.secret-string.set#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.keyvault.secret-string.set#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.keyvault.secret-string.set#VERSION }
    inputs:
      subscriptionId:
      loginId:
      loginSecret:
      name:
      value:
      vault:
      # end optional args
      description:
      disabled:
      expires:
      loginTenantId:
      loginType:
      # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.keyvault.secret-string.set/issues)
