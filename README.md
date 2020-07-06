# DotConfig

Automatically updated and deployable configuration for my linux systems.

## Dependencies

### Core

Those programs are required to deploy this configuration.

- fzf     : command line fuzzy finder
- dotbare : interactive dotfiles manager that rely on fzf

### Git

- detla : git diff syntax highlighter

## Installation

### Manual

```sh
dotbare finit -u [URL]

# Do not track README.md for changes and remove it localy
dotbare update-index --assume-unchanged README.md && rm README.md
```
