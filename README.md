[![build](https://github.com/opspec-pkgs/azure.keyvault.secret-string.set/actions/workflows/build.yml/badge.svg)](https://github.com/opspec-pkgs/azure.keyvault.secret-string.set/actions/workflows/build.yml)


<img src="icon.svg" alt="icon" height="100px">

# Problem statement

sets a secret string in azure keyvault (if it's not already set)

# Example usage

## Visualize

```shell
opctl ui github.com/opspec-pkgs/azure.keyvault.secret-string.set#3.1.0
```

## Run

```
opctl run github.com/opspec-pkgs/azure.keyvault.secret-string.set#3.1.0
```

## Compose

```yaml
op:
  ref: github.com/opspec-pkgs/azure.keyvault.secret-string.set#3.1.0
  inputs:
    loginId:  # 👈 required; provide a value
    loginSecret:  # 👈 required; provide a value
    name:  # 👈 required; provide a value
    subscriptionId:  # 👈 required; provide a value
    value:  # 👈 required; provide a value
    vault:  # 👈 required; provide a value
  ## uncomment to override defaults
  #   description: "keyvault secret"
  #   disabled: "false"
  #   expires: "2018-06-13"
  #   loginTenantId: " "
  #   loginType: "user"
```

# Support

join us on
[![Slack](https://img.shields.io/badge/slack-opctl-E01563.svg)](https://join.slack.com/t/opctl/shared_invite/zt-51zodvjn-Ul_UXfkhqYLWZPQTvNPp5w)
or
[open an issue](https://github.com/opspec-pkgs/azure.keyvault.secret-string.set/issues)

# Releases

releases are versioned according to
[![semver 2.0.0](https://img.shields.io/badge/semver-2.0.0-brightgreen.svg)](http://semver.org/spec/v2.0.0.html)
and [tagged](https://git-scm.com/book/en/v2/Git-Basics-Tagging); see
[CHANGELOG.md](CHANGELOG.md) for release notes

# Contributing

see
[project/CONTRIBUTING.md](https://github.com/opspec-pkgs/project/blob/main/CONTRIBUTING.md)
