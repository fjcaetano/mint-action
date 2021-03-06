Github Action: mint ![CI Badge] ![macos | ubuntu]
======

Installs a Swift package using the [Mint] package manager.

## Inputs

### package

The Swift package to be installed. The package can be a shorthand for a github repo "githubName/repo", or a fully qualified .git path.
An optional version can be specified by appending @version to the repo, otherwise the newest tag will be used (or master if no tags are found.)

### mint-version

The version of Mint to be installed. Unused if Mint is already installed

## Usage

Add the step to your workflow:
```yaml
- name: Install fjcaetano/mint-action-test-package
  uses: fjcaetano/mint-action
  with:
    package: fjcaetano/mint-action-test-package
```

You can refer to [.github/workflows/main.yml](.github/workflows/main.yml) as an example configuration. Feel free to check the [latest builds](https://github.com/fjcaetano/mint-action/actions) too.

<!-- Links -->

[CI Badge]: https://github.com/fjcaetano/mint-action/actions/workflows/main.yml/badge.svg?branch=main
[macos | ubuntu]: https://img.shields.io/badge/platform-macos%20%7C%20ubuntu-lightgrey
[Mint]: https://github.com/yonaskolb/Mint