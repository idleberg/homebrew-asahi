# :beer: homebrew-asahi

> Unified tap to distribute my Homebrew formulas.

[![License](https://img.shields.io/github/license/idleberg/homebrew-asahi?color=blue&style=for-the-badge)](LICENSE)
[![Build](https://img.shields.io/github/actions/workflow/status/idleberg/homebrew-asahi/audit.yml?style=for-the-badge)](https://github.com/idleberg/homebrew-asahi/actions)

## Usage

> [!NOTE]  
> Previously contained formulas/casks are now listed in [DEPRECATED.md](DEPRECATED.md).

Tap this repository to install the available software:

```sh
$ brew tap idleberg/asahi
```
```

## Software

Once tapped, you can install any included cask as follows:

```sh
$ brew install --cask <cask>
```

Alternatively, you can install any cask without tapping:

```sh
$ brew install --cask idleberg/asahi/<cask>
```

The following casks are part of this repository:

- `dbxcli`: Command-line client for Dropbox

### Formulas

Once tapped, you can install any included cask as follows:

```sh
$ brew install <formula>
```

Alternatively, you can install any formula without tapping:

```sh
$ brew install idleberg/asahi/<formula>
```

The following formulas are part of this repository:

- `dropboxignore`: Command-line tool for ignoring files in Dropbox
- `krampus`: Command-line tool to kill one or more processes by their port number

## License

This work is licensed under [The MIT License](LICENSE).
