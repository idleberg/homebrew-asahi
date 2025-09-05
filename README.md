# :beer: homebrew-asahi

> Unified tap to distribute my Homebrew formulae.

[![License](https://img.shields.io/github/license/idleberg/homebrew-asahi?color=blue&style=for-the-badge)](LICENSE)
[![Build](https://img.shields.io/github/actions/workflow/status/idleberg/homebrew-asahi/audit.yml?style=for-the-badge)](https://github.com/idleberg/homebrew-asahi/actions)

## Usage

Any included software can be installed directly using either of these commands:

```sh
# Formulae
$ brew install idleberg/asahi/<formula>

# Casks
$ brew install --cask idleberg/asahi/<cask>
```

Alternatively, you can "tap" into the repository, basically adding it as installation source, and discard the prefixes when installing:

```sh
$ brew tap idleberg/asahi
```
### Formulae

```sh
$ brew install <formula>
```

### Casks

```sh
$ brew install --cask <cask>
```

## Software

> [!NOTE]  
> If you're missing a previously available software, it's probably listed in [DEPRECATED.md](DEPRECATED.md).

### Casks

- `dbxcli`: Command-line client for Dropbox
- `NormCap`: OCR-powered screenshot tool to capture text instead of images

### Formulae

- `dropboxignore`: Command-line tool for ignoring files in Dropbox
- `krampus`: Command-line tool to kill one or more processes by their port number

## License

This work is licensed under [The MIT License](LICENSE).
